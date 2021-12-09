CLASS zcl_insert_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
      INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_INSERT_DATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: dbmovie TYPE TABLE OF zdb_movie.

    dbmovie = VALUE #(
     ( movie_id = '2236844874133981'
            person_id ='2732629816152764'
            rating = '8'
            movie_name ='Dune'
            release_year = 2021
            genre ='Sci-fi/Adventure'
            rated = '12'
            duration = 155
            avatar = 'https://www.ixpap.com/images/2021/10/Dune-2021-Wallpaper-4.jpg' )
    ( movie_id = '8522056309987457'
            person_id ='3907059523556088'
            rating = '9.3'
            movie_name ='Die Verurteilten'
            release_year = 1994
            genre ='Drama'
            rated = '12'
            duration = 142
            avatar = 'https://m.media-amazon.com/images/I/517SDGYY26L.jpg' )
    ( movie_id = '6485891211708680'
            person_id ='6687126073939348'
            rating = '9.2'
            movie_name ='Der Pate'
            release_year = 1972
            genre ='Crime,Drama'
            rated = '16'
            duration = 175
            avatar = 'https://upload.wikimedia.org/wikipedia/en/1/1c/Godfather_ver1.jpg' )
    ( movie_id = '2321132602862511'
            person_id ='1645181515427026'
            rating = '9'
            movie_name ='The Dark Knight'
            release_year = 2008
            genre ='Action,Drama'
            rated = '16'
            duration = 152
            avatar = 'https://m.media-amazon.com/images/I/71Gqqky8sEL._SL1200_.jpg')
    ( movie_id = '5267977246985106'
            person_id ='5165482513286000'
            rating = '12'
            movie_name ='Die zwölf Geschworenen'
            release_year = 1957
            genre ='Crime'
            rated = '12'
            duration = 96
            avatar = 'https://m.media-amazon.com/images/I/71chER4N8YL._SL1200_.jpg')
    ( movie_id = '2845704878596725'
            person_id ='6687126073939348'
            rating = '9'
            movie_name ='Der Pate 2'
            release_year = 1974
            genre ='Crime, Drama'
            rated = '16'
            duration =  202
            avatar = 'https://upload.wikimedia.org/wikipedia/en/1/1c/Godfather_ver1.jpg')
    ( movie_id = '2670330803895046'
            person_id ='2732629816152760'
            rating = '8.9'
            movie_name ='Der Herr der Ringe:Die Rückkehr des Königs'
            release_year = 2003
            genre ='Action, Drama'
            rated = '12'
            duration = 201
            avatar = 'https://m.media-amazon.com/images/I/519bOjTzUWL.jpg' )
    ( movie_id = '5887118072954266'
            person_id ='7658006395360623'
            rating = '8.9'
            movie_name ='Pulp Fiction'
            release_year = 1994
            genre ='Crime,Drama'
            rated = '16'
            duration = 154
            avatar = 'https://m.media-amazon.com/images/I/81-NJGwcsGL._SL1400_.jpg' )
    ( movie_id = '7537360219204258'
            person_id ='2906167594148450'
            rating = '8.9'
            movie_name ='Schindlers Liste'
            release_year = 1993
            genre ='Drama, History'
            rated = '12'
            duration = 195
            avatar = 'https://de.web.img3.acsta.net/pictures/18/11/19/14/27/1841128.jpg')
    ( movie_id = '1630007273092687'
            person_id ='1645181515427026'
            rating = '8.8'
            movie_name ='Inception'
            release_year = 2010
            genre ='Action, Sci-Fi'
            rated = '12'
            duration = 148
            avatar = 'https://m.media-amazon.com/images/I/71SBgi0X2KL._SL1200_.jpg' )
    ( movie_id = '1029063336811741'
        person_id ='1077440190708417'
        rating = '8.8'
        movie_name ='Fight Club'
        release_year = 1999
        genre ='Drama'
        rated = '18'
        duration = 139
        avatar = 'https://upload.wikimedia.org/wikipedia/en/f/fc/Fight_Club_poster.jpg' )
    ( movie_id = '2969372191785103'
        person_id ='2732629816152760'
        rating = '8.8'
        movie_name ='Der Herr der Ringe: Die Gefährten'
        release_year = 2001
        genre ='Drama, Adventure'
        rated = '16'
        duration = 178
        avatar = 'https://m.media-amazon.com/images/I/519bOjTzUWL.jpg')
    ( movie_id = '6515455805600163'
        person_id ='7815525789413221'
        rating = '8.8'
        movie_name ='Forrest Gump'
        release_year = 1994
        genre ='Drama'
        rated = '12'
        duration = 142
         avatar = 'https://m.media-amazon.com/images/I/61eAL7QPTRL._SY445_.jpg')
    ( movie_id = '9899070593420890'
        person_id ='5369167233136080'
        rating = '8.8'
        movie_name ='Zwei glorreiche Halunken'
        release_year = 1966
        genre ='Western'
        rated = '18'
        duration = 161
        avatar = '' )
    ( movie_id = '2115064926407405'
        person_id ='2732629816152760'
        rating = '8.7'
        movie_name ='Der Herr der Ringe: Die zwei Türme'
        release_year = 2002
        genre ='Drama, Adventure'
        rated = '12'
        duration = 179
        avatar = '' )

        ( movie_id = '8636053842746856'
        person_id ='3128513855147110'
        rating = '8.7'
        movie_name ='Matrix'
        release_year = 1999
        genre ='Sci-Fi'
        rated = '16'
        duration = 136
        avatar = '' )

( movie_id = '7019074809912265'
        person_id ='9951654726540366'
        rating = '8.7'
        movie_name ='GoodFellas - Drei Jahrzehnte in der Mafia'
        release_year = 1990
        genre ='Biography, Crime, Drama '
        rated = '16'
        duration = 146
        avatar = '')
( movie_id = '1321098354599406'
        person_id ='7457755832192442'
        rating = '8.7'
        movie_name ='Das Imperium schlägt zurück'
        release_year = 1980
        genre ='Action, Adventure, Fantasy '
        rated = '12'
        duration = 124
        avatar = '')
        ( movie_id = '0224972549323740'
        person_id ='1107370413411508'
        rating = '8.7'
        movie_name ='Einer flog über das Kuckucksnest '
        release_year = 1975
        genre ='Drama'
        rated = '16'
        duration = 133
        avatar = '' )
( movie_id = '6936265318405276'
        person_id ='2313180367233486'
        rating = '8.7'
        movie_name ='Parasite'
        release_year = 2019
        genre ='Comedy, Drama, Thriller'
        rated = '16'
        duration = 132
        avatar = 'https://images-na.ssl-images-amazon.com/images/I/91WkkO0UbAL._RI_.jpg'  )
        ).

DELETE FROM zdb_movie.
INSERT zdb_movie FROM TABLE @dbmovie.

 out->write( 'Data inserted' ).

DATA: dbperson TYPE TABLE OF zdb_person.

  dbperson = VALUE #(
            ( person_id ='1645181515427026'
        firstname = 'Christopher'
        lastname = 'Nolan'
        birthday = '30.7.1970'
        nationality = 'England' )

    ( person_id ='5267977246985106'
        firstname = 'Sidney'
        lastname = 'Lumet'
        birthday = '25.6.1924'
        nationality = 'USA' )

    ( person_id ='2732629816152760'
        firstname = 'Peter'
        lastname = 'Jackson'
        birthday = '31.10.1961'
        nationality = 'Neuseeland' )

    ( person_id ='7658006395360623'
        firstname = 'Quentin'
        lastname = 'Tarantino'
        birthday = '27.5.1963'
        nationality = 'USA' )

    ( person_id ='7537360219204258'
        firstname = 'Steven'
        lastname = 'Spielberg'
        birthday = '18.12.1946'
        nationality = 'USA' )

    ( person_id ='1077440190708417'
        firstname = 'David'
        lastname = 'Fincher'
        birthday = '28.8.1962'
        nationality = 'USA' )

    ( person_id ='7815525789413221'
        firstname = 'Robert'
        lastname = 'Zemeckis'
        birthday = '14.05.1951'
        nationality = 'USA' )

    ( person_id ='5369167233136080'
        firstname = 'Sergio'
        lastname = 'Leone'
        birthday = '03.01.1929'
        nationality = 'Italien' )

    ( person_id ='3128513855147110'
        firstname = 'Lana'
        lastname = 'Wachowski'
        birthday = '21.7.1965'
        nationality = 'USA' )

    ( person_id ='9951654726540366'
        firstname = 'Martin'
        lastname = 'Scorsese'
        birthday = '17.11.1942'
        nationality = 'USA' )

    ( person_id ='7457755832192442'
        firstname = 'Irvin'
        lastname = 'Kershner'
        birthday = '29.4.1923'
        nationality = 'USA' )

    ( person_id ='1107370413411508'
        firstname = 'Milos'
        lastname = 'Forman'
        birthday = '18.2.1932'
        nationality = 'Tschechoslowakei' )

    ( person_id ='2313180367233486'
        firstname = 'Bong Joon'
        lastname = 'Ho'
        birthday = '14.9.1969'
        nationality = 'Südkorea' )

     ( person_id ='2732629816152764'
        firstname = 'Denis'
        lastname = 'Villeneuve'
        birthday = '3.10.1967'
        nationality = 'Kanada' )

        ).
DELETE FROM zdb_person.
INSERT zdb_person FROM TABLE @dbperson.

 out->write( 'Data inserted' ).

  ENDMETHOD.
ENDCLASS.
