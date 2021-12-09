@EndUserText.label: 'Person BO projection view'
@AccessControl.authorizationCheck: #CHECK
@Search.searchable: true
@Metadata.allowExtensions: true

define root view entity ZC_PERSON_SR as projection on ZI_PERSON_SR{
    @Search.defaultSearchElement: true
    key PersonId,
    @Search.defaultSearchElement: true
    Firstname,
    @Search.defaultSearchElement: true
    Lastname,
    Birthday,
    Nationality,
    created_by,
    created_at,
    last_changed_by,
    last_changed_at
    
}
