Profile: GEM_ERPEU_PR_PAR_CloseOperation_Input
Parent: Parameters
Id: GEM-ERPEU-PR-PAR-Close-Operation-Input
Title: "GEM ERP PR EU CloseOperation Input"
Description: "This profile defines the parameters for receiving dispense information for a prescription that was redeemed in the EU"
* insert Profile(GEM_ERPEU_PR_PAR_CloseOperation_Input)

* parameter MS

* parameter ^slicing.discriminator.type = #pattern
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed

* parameter contains 
  rxDispensation 1..*
  and requestData 1..1
  and practitionerData 1..1
  and organizationData 1..1
  and practitionerRoleData 1..1

* parameter[requestData]
  * name MS
  * name = "requestData"
  * value[x] 0..0
  * resource 0..0
  * part MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "name"
    * ^slicing.rules = #closed
  * part contains
    kvnr 1..1 MS and
    accessCode 1..1 MS and
    countryCode 1..1 MS and
    practitionerName 1..1 MS and
    practitionerRole 1..1 MS and
    pointOfCare 1..1 MS and
    healthcare-facility-type 1..1 MS
  * part[kvnr]
    * name MS
    * name = "kvnr"
    * value[x] 1..1
    * value[x] only Identifier
    * valueIdentifier only IdentifierKvid10
    * resource 0..0
    * part 0..0
  * part[accessCode]
    * name MS
    * name = "accessCode"
    * value[x] 1..1
    * value[x] only Identifier
    * valueIdentifier only GEM_ERPEU_PR_Access_Code
    * resource 0..0
    * part 0..0
  * part[countryCode]
    * name MS
    * name = "countryCode"
    * value[x] 1..1
    * value[x] only Coding
    * valueCoding.system 1..1
    * valueCoding.system = $cs-iso-3166
    * valueCoding from Iso3166-1-2 (required) // Nach VZD Profil NCPeHCountryEx
  * part[practitionerName]
    * name MS
    * name = "practitionerName"
    * value[x] 1..1
    * value[x] only string
    * resource 0..0
    * part 0..0
  * part[practitionerRole]
    * name MS
    * name = "practitionerRole"
    * value[x] 1..1
    * value[x] only Coding
    * valueCoding from GEM_ERPEU_VS_PractitionerRole (required)
      * system 1..1 MS
    * resource 0..0
    * part 0..0
  * part[pointOfCare]
    * name MS
    * name = "pointOfCare"
    * value[x] 1..1
    * value[x] only string
    * resource 0..0
    * part 0..0
  * part[healthcare-facility-type]
    * name MS
    * name = "healthcare-facility-type"
    * value[x] 1..1
    * value[x] only Coding
    * valueCoding from GEM_ERPEU_VS_HealthCareFacilityType (required)
      * system 1..1 MS
    * resource 0..0
    * part 0..0

// Generic Data that applys to all dispensations
* parameter[practitionerData]
  * name MS
  * name = "practitionerData"
  * value[x] 0..0
  * resource only GEM_ERPEU_PR_Practitioner
  * part 0..0
* parameter[organizationData]
  * name MS
  * name = "organizationData"
  * value[x] 0..0
  * resource only GEM_ERPEU_PR_Organization
  * part 0..0
* parameter[practitionerRoleData]
  * name MS
  * name = "practitionerRoleData"
  * value[x] 0..0
  * resource only GEM_ERPEU_PR_PractitionerRole
  * part 0..0

* parameter[rxDispensation]
  * name MS
  * name = "rxDispensation"
  * value[x] 0..0
  * resource 0..0
  * obeys erp-eu-parameters-close-dispense-medication-references
  * part MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "name"
    * ^slicing.rules = #closed
  * part contains
    medicationDispense 1..1 and
    medication 1..1
  * part[medicationDispense]
    * name MS
    * name = "medicationDispense"
    * value[x] 0..0
    * resource 1..1
    * resource only GEM_ERPEU_PR_MedicationDispense
    * part 0..0
  * part[medication]
    * name MS
    * name = "medication"
    * value[x] 0..0
    * resource 1..1
    * resource only GEM_ERP_PR_Medication
    * part 0..0

Invariant: erp-eu-parameters-close-dispense-medication-references
Description: "If a reference from a MedicationDispense to a Medication exists, the reference must resolve to the Medication."
Expression: "part.where(name = 'medicationDispense').resource.medication.ofType(Reference).reference.exists() implies ((part.where(name = 'medicationDispense').resource.medication.reference.split('/').last().split(':').last()) = (part.where(name = 'medication').resource.id))"
Severity: #error
