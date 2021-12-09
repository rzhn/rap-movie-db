CLASS lhc_Movie DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Movie RESULT result.

    METHODS CalculateMovieKey FOR DETERMINATION Movie~CalculateMovieKey
      IMPORTING keys FOR Movie.

    METHODS rateMovie FOR MODIFY
      IMPORTING keys FOR ACTION Movie~rateMovie RESULT result.
    METHODS reset FOR MODIFY
      IMPORTING keys FOR ACTION Movie~reset RESULT result.

    METHODS setWatched FOR MODIFY
      IMPORTING keys FOR ACTION Movie~setWatched RESULT result.

    METHODS validateDates FOR VALIDATE ON SAVE
      IMPORTING keys FOR Movie~validateDates.

    METHODS validateMandatoryFields FOR VALIDATE ON SAVE
      IMPORTING keys FOR Movie~validateMandatoryFields.

    METHODS validatePerson FOR VALIDATE ON SAVE
      IMPORTING keys FOR Movie~validatePerson.


ENDCLASS.

CLASS lhc_Movie IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD CalculateMovieKey.
  SELECT FROM zi_movie_sr
        FIELDS MAX( movieid ) INTO @DATA(lv_max_movieid).

    LOOP AT keys INTO DATA(ls_key).
      lv_max_movieid = lv_max_movieid + 1.
      MODIFY ENTITIES OF zi_movie_sr  IN LOCAL MODE
        ENTITY Movie
          UPDATE SET FIELDS WITH VALUE #( ( movieid = lv_max_movieid ) )
          REPORTED DATA(ls_reported).
      APPEND LINES OF ls_reported-movie TO reported-movie.
    ENDLOOP.
  ENDMETHOD.

*  *******************************************************************************
*
*   Implements rateMovie action (in our case: for rating movie [0-5]
*
*  *******************************************************************************
  METHOD rateMovie.
  ENDMETHOD.


*  *******************************************************************************
*
*   Implements reset action (in our case: for setting movie to unwatched)
*
*  *******************************************************************************
  METHOD reset.
    MODIFY ENTITIES OF zi_movie_sr IN LOCAL MODE
           ENTITY Movie
              UPDATE FROM VALUE #( FOR key IN keys ( movieid = key-movieid
                                                     watched = abap_false
                                                     %control-watched = if_abap_behv=>mk-on ) )
           FAILED   failed
           REPORTED reported.

    " Read changed data for action result
    READ ENTITIES OF zi_movie_sr IN LOCAL MODE
         ENTITY Movie
         FROM VALUE #( FOR key IN keys (  movieid = key-movieid
                                          %control = VALUE #(
                                            personid        = if_abap_behv=>mk-on
                                            category        = if_abap_behv=>mk-on
                                            rating          = if_abap_behv=>mk-on
                                            moviename       = if_abap_behv=>mk-on
                                            releaseyear     = if_abap_behv=>mk-on
                                            genre           = if_abap_behv=>mk-on
                                            rated           = if_abap_behv=>mk-on
                                            duration        = if_abap_behv=>mk-on
                                            avatar          = if_abap_behv=>mk-on
                                            watched         = if_abap_behv=>mk-on
                                            created_by      = if_abap_behv=>mk-on
                                            created_at      = if_abap_behv=>mk-on
                                            last_changed_by = if_abap_behv=>mk-on
                                            last_changed_at = if_abap_behv=>mk-on
                                          ) ) )
         RESULT DATA(lt_movie).
    result = VALUE #( FOR movie IN lt_movie (  movieid = movie-movieid
                                               %param  = movie ) ).
  ENDMETHOD.


*  *******************************************************************************
*
*   Implements Watched action (in our case: for setting movie to watched)
*
*  *******************************************************************************
  METHOD setWatched.
  MODIFY ENTITIES OF zi_movie_sr IN LOCAL MODE
           ENTITY Movie
              UPDATE FROM VALUE #( FOR key IN keys ( movieid = key-movieid
                                                     watched = abap_true
                                                     %control-watched = if_abap_behv=>mk-on ) )
           FAILED   failed
           REPORTED reported.

    " Read changed data for action result
    READ ENTITIES OF zi_movie_sr IN LOCAL MODE
         ENTITY Movie
         FROM VALUE #( FOR key IN keys (  movieid = key-movieid
                                          %control = VALUE #(
                                            personid        = if_abap_behv=>mk-on
                                            category        = if_abap_behv=>mk-on
                                            rating          = if_abap_behv=>mk-on
                                            moviename       = if_abap_behv=>mk-on
                                            releaseyear     = if_abap_behv=>mk-on
                                            genre           = if_abap_behv=>mk-on
                                            rated           = if_abap_behv=>mk-on
                                            duration        = if_abap_behv=>mk-on
                                            avatar          = if_abap_behv=>mk-on
                                            watched         = if_abap_behv=>mk-on
                                            created_by      = if_abap_behv=>mk-on
                                            created_at      = if_abap_behv=>mk-on
                                            last_changed_by = if_abap_behv=>mk-on
                                            last_changed_at = if_abap_behv=>mk-on
                                          ) ) )
         RESULT DATA(lt_movie).
    result = VALUE #( FOR movie IN lt_movie (  movieid = movie-movieid
                                               %param  = movie ) ).
  ENDMETHOD.
*  *******************************************************************************
*
*   Validate Person
*
*  *******************************************************************************
    METHOD validatePerson.
         " Read relevant travel instance data
    READ ENTITIES OF zi_movie_sr IN LOCAL MODE
      ENTITY Movie
        FIELDS ( PersonID ) WITH CORRESPONDING #( keys )
      RESULT DATA(movies).

    DATA persons TYPE SORTED TABLE OF zdb_person WITH UNIQUE KEY person_id.

    " Optimization of DB select: extract distinct non-initial customer IDs
    persons = CORRESPONDING #( movies DISCARDING DUPLICATES MAPPING person_id = PersonID EXCEPT * ).
    DELETE persons WHERE person_id IS INITIAL.
    IF persons IS NOT INITIAL.
      " Check if customer ID exist
      SELECT FROM zdb_person FIELDS person_id
        FOR ALL ENTRIES IN @persons
        WHERE person_id = @persons-person_id
        INTO TABLE @DATA(persons_db).
    ENDIF.

    " Raise msg for non existing and initial customerID
    LOOP AT movies INTO DATA(movie).
      IF movie-PersonID IS INITIAL OR NOT line_exists( persons_db[ person_id = movie-PersonID ] ).
        APPEND VALUE #(  %tky = movie-%tky ) TO failed-movie.

        APPEND VALUE #( %key = movie-%key
                     %msg  = new_message(
                    id   = 'ZMOVIE_MSG_SR'
                    number = '001'
                    severity = if_abap_behv_message=>severity-error )
                    ) TO reported-movie.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.


*  *******************************************************************************
*
*   Validate Dates --> Date cannot be in the future.
*
*  *******************************************************************************
  METHOD validateDates.
  READ ENTITIES OF zi_movie_sr IN LOCAL MODE

            ENTITY Movie
        FIELDS ( releaseyear ) WITH CORRESPONDING #( keys )
        RESULT DATA(lt_movie).

   "Check if mandatory fields are not empty + write error message
    LOOP AT lt_movie INTO DATA(ls_movie).
      IF ls_movie-releaseyear > cl_abap_context_info=>get_system_date( ).
        APPEND VALUE #(  %key = ls_movie-%key ) TO failed-movie.
        APPEND VALUE #( %key = ls_movie-%key
                  %msg  = new_message(
                    id   = 'ZMOVIE_MSG_SR'
                    number = '002'
                    severity = if_abap_behv_message=>severity-error )
                    ) TO reported-movie.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

*  *******************************************************************************
*
*   Check if mandatory fields are not empty + write error message
*
*  *******************************************************************************

  METHOD validateMandatoryFields.

   READ ENTITIES OF zi_movie_sr IN LOCAL MODE

            ENTITY Movie
        FIELDS ( moviename personid ) WITH CORRESPONDING #( keys )
        RESULT DATA(lt_movie).

   "Check if mandatory fields are not empty + write error message
    LOOP AT lt_movie INTO DATA(ls_movie).
      IF ls_movie-moviename = ''.
        APPEND VALUE #(  %key = ls_movie-%key ) TO failed-movie.
        APPEND VALUE #( %key = ls_movie-%key
                  %msg  = new_message(
                    id   = 'ZMOVIE_MSG_SR'
                    number = '005'
                    severity = if_abap_behv_message=>severity-error )
                    ) TO reported-movie.
      ENDIF.
      IF ls_movie-personid = ''.
        APPEND VALUE #(  %key = ls_movie-%key ) TO failed-movie.
        APPEND VALUE #( %key = ls_movie-%key
                  %msg  = new_message(
                    id   = 'ZMOVIE_MSG_SR'
                    number = '001'
                    severity = if_abap_behv_message=>severity-error )
                    ) TO reported-movie.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
