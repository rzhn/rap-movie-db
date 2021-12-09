@EndUserText.label: 'Movie BO projection view'
@AccessControl.authorizationCheck: #CHECK
@Search.searchable: true
@Metadata.allowExtensions: true
 
define root view entity ZC_MOVIE_SR 
as projection on ZI_MOVIE_SR as MovieDB {
    
    @Search.defaultSearchElement: true
    key MovieId,
    @Search.defaultSearchElement: true
    PersonId,
    @Search.defaultSearchElement: true
    Category,
    Rating,
    @Search.defaultSearchElement: true
    MovieName,
    @Search.defaultSearchElement: true
    ReleaseYear,
    @Search.defaultSearchElement: true
    Genre,
    @Search.defaultSearchElement: true
    Rated,
    Duration,
    Avatar,
    Watched,
    CustomRate,
    created_by,
    created_at,
    last_changed_by,
    last_changed_at,
    /* Associations */
    _Persondb: redirected to ZC_PERSON_SR
}
