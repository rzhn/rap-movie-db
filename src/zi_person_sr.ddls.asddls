@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Data definition for person'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZI_PERSON_SR 
as select from zdb_person as Persondb


{

    key person_id as PersonId,
    firstname as Firstname,
    lastname as Lastname,
    birthday as Birthday,
    nationality as Nationality,
    @Semantics.user.createdBy: true
    created_by,
    @Semantics.systemDateTime.createdAt: true
    created_at,
    @Semantics.user.lastChangedBy: true
    last_changed_by,
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at
    
}
