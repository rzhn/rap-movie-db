CLASS lhc_Person DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS validateDate FOR VALIDATE ON SAVE
      IMPORTING keys FOR Person~validateDate.

    METHODS validateLastnames FOR VALIDATE ON SAVE
      IMPORTING keys FOR Person~validateLastnames.

    METHODS validateNames FOR VALIDATE ON SAVE
      IMPORTING keys FOR Person~validateNames.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Person RESULT result.

ENDCLASS.

CLASS lhc_Person IMPLEMENTATION.

  METHOD validateDate.
  READ ENTITIES OF zi_person_sr IN LOCAL MODE

            ENTITY Person
        FIELDS ( birthday ) WITH CORRESPONDING #( keys )
        RESULT DATA(lt_person).

   "Check if mandatory fields are not empty + write error message
    LOOP AT lt_person INTO DATA(ls_person).
      IF ls_person-birthday > cl_abap_context_info=>get_system_date( ).
        APPEND VALUE #(  %key = ls_person-%key ) TO failed-person.
        APPEND VALUE #( %key = ls_person-%key
                  %msg  = new_message(
                    id   = 'ZMOVIE_MSG_SR'
                    number = '002'
                    severity = if_abap_behv_message=>severity-error )
                    ) TO reported-person.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validateLastnames.
  READ ENTITIES OF zi_person_sr IN LOCAL MODE

            ENTITY Person
        FIELDS ( lastname ) WITH CORRESPONDING #( keys )
        RESULT DATA(lt_person).

      LOOP AT lt_person INTO DATA(ls_person).
      IF ls_person-lastname = ''.
        APPEND VALUE #(  %key = ls_person-%key ) TO failed-person.
        APPEND VALUE #( %key = ls_person-%key
                  %msg  = new_message(
                    id   = 'ZMOVIE_MSG_SR'
                    number = '006'
                    severity = if_abap_behv_message=>severity-error )
                    ) TO reported-person.
      ENDIF.
      ENDLOOP.
  ENDMETHOD.

  METHOD validateNames.
   READ ENTITIES OF zi_person_sr IN LOCAL MODE

            ENTITY Person
        FIELDS ( firstname ) WITH CORRESPONDING #( keys )
        RESULT DATA(lt_person).

      LOOP AT lt_person INTO DATA(ls_person).
      IF ls_person-firstname = ''.
        APPEND VALUE #(  %key = ls_person-%key ) TO failed-person.
        APPEND VALUE #( %key = ls_person-%key
                  %msg  = new_message(
                    id   = 'ZMOVIE_MSG_SR'
                    number = '006'
                    severity = if_abap_behv_message=>severity-error )
                    ) TO reported-person.
      ENDIF.
      ENDLOOP.
  ENDMETHOD.

  METHOD get_instance_features.
  ENDMETHOD.

ENDCLASS.
