Profile: GEM_ERPEU_PR_MedicationDispense
Parent: MedicationDispense
Id: GEM-ERPEU-PR-MedicationDispense
Title: "Dispensation of the Prescription from the EU"
Description: "Handles information about the redeem of the prescription and the submited medication from the EU."
* insert Profile(GEM_ERPEU_PR_MedicationDispense)

// Copy from EPA Start ---
* extension contains RxPrescriptionProcessIdentifierExtension named rxPrescriptionProcessIdentifier 0..1

* extension[rxPrescriptionProcessIdentifier].value[x]
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "$this"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false
* identifier 0..
* identifier contains
    RxOriginatorProcessIdentifier 0..1 and
    EPADispensationIdentifier 0..1
* identifier[RxOriginatorProcessIdentifier] only RxOriginatorProcessIdentifier
* identifier[RxOriginatorProcessIdentifier] ^patternIdentifier.system = $sid-identifier-rx-originator-process
* identifier[EPADispensationIdentifier] only EPADispensationIdentifier
* identifier[EPADispensationIdentifier] ^patternIdentifier.system = $sid-identifier-dispensation
* status from EPAMedicationDispenseStatusVS
  * ^short = "Status of medication dispense"
* category MS
  * ^short = "Missing value indicates a prescription dispense."
* category from EPAMedicationDispenseCategoryVS
  * ^binding.description = "Defines the context of a Dispensation: prescription or non-prescription"

* medication[x] only Reference
* medicationReference MS
* medicationReference only Reference(Medication)

* subject 1..1 MS
* subject only Reference(Patient)
  * identifier 1..1 MS
  * identifier only IdentifierKvid10

* performer 1..1 MS

* authorizingPrescription 0..
  * reference 1.. MS
* authorizingPrescription only Reference(MedicationRequest)
* whenHandedOver 1.. MS
* dosageInstruction MS
* substitution MS

// Copy from EPA End ---

* identifier contains prescriptionID 1..1
* identifier[prescriptionID] only GEM_ERP_PR_PrescriptionId
* identifier[prescriptionID] ^patternIdentifier.system = $prescription-id-ns
* identifier ^short = "ePrescription identifier"

* status = #completed (exactly)
* status ^short = "completed"

* medication[x] only Reference(GEM_ERP_PR_Medication)
* medication[x] MS
  * ^definition = "The MedicationDispense references a medication which was dispensed"

* performer 1..1
  * ^definition = "References a pracitioner role in order to state practitioner and organization information"
* performer.actor only Reference(GEM_ERPEU_PR_PractitionerRole)

* whenHandedOver 1..1 MS
* whenHandedOver obeys erp-eu-abgabeDatumsFormat
* whenPrepared obeys erp-eu-abgabeDatumsFormat

* substitution MS
* substitution.wasSubstituted MS
  * ^short = "Indicates whether a substitution was made on the dispensed medication"

* dosageInstruction MS

* quantity MS
  * ^short = "Number of dispensed packages/ units"
  * value MS
  * unit MS

Invariant: erp-eu-abgabeDatumsFormat
Description: "Wert muss ein Datum in der Form: YYYY-MM-DD sein."
* severity = #error
* expression = "toString().length()=10"