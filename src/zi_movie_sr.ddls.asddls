@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Movie BO view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

define root view entity ZI_MOVIE_SR 
as select from zdb_movie as MovieDB 
    
association [0..1] to ZI_PERSON_SR as _Persondb on $projection.PersonId = _Persondb.PersonId
    
{
    key movie_id as MovieId,
    person_id as PersonId,
    category as Category,
    rating as Rating,
    movie_name as MovieName,
    release_year as ReleaseYear,
    genre as Genre,
    rated as Rated,
    duration as Duration,
    avatar as Avatar,
    watched  as Watched,
    custom_rate  as CustomRate,
    @Semantics.user.createdBy: true
    created_by,
    @Semantics.systemDateTime.createdAt: true
    created_at,
    @Semantics.user.lastChangedBy: true
    last_changed_by,
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at,

     /* associations */
     _Persondb
}
