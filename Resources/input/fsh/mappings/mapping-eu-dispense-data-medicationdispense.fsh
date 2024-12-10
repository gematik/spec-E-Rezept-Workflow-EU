Mapping: GEM_ERPEU_MAP_Dispense_Data_MedicationDispense
Source: GEM_ERPEU_LOG_DispenseData
Target: "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERPEU_PR_MedicationDispense"
Id: GEM-ERPEU-MAP-EU-Data-MedicationDispense
Title: "Mapping for EU DispenseData to EU-MedicationDispense"
Description: "This mapping maps the logical information of the EU DispenseData to the EU-MedicationDispense"
* PatientData -> "GEM_ERPEU_PR_MedicationDispense"
  * RegionalNationalHealthIdentifier -> "MedicationDispense.subject.identifier"
* DispenseData -> "GEM_ERPEU_PR_MedicationDispense"
  * AdministrativeInformation -> "GEM_ERPEU_PR_MedicationDispense"
    * DispensationIdentifier -> "MedicationDispense.id"
    * PrescriptionIdentifier -> "MedicationDispense.identifier[prescriptionID]"
    * PrescriptionItemIdentifier -> "n/a"
    * DateOfIssueOfDispensation -> "MedicationDispense.whenHandedOver"
    * Substitution -> "MedicationDispense.substitution.wasSubstituted"
    * NumberOfPackages -> "MedicationDispense.quantity"

Mapping: GEM_ERPEU_MAP_Dispense_Data_Medication
Source: GEM_ERPEU_LOG_DispenseData
Target: "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERPEU_PR_Medication"
Id: GEM-ERPEU-MAP-EU-Data-Medication
Title: "Mapping for EU MedicationData to GEM_ERPEU_PR_Medication"
Description: "This mapping maps the logical information of the EU MedicationData to GEM_ERPEU_PR_Medication"
* DispenseData -> "GEM_ERPEU_PR_MedicationDispense"
  * MedicinalInformation -> "GEM_ERPEU_PR_MedicationDispense.medicationReference"
    * MedicinalProductIdentifier -> "Medication.code.[eu-??]" //TODO: BfArM erfragt system
    * MedicinalProductBrandName -> "Medication.code.text"

    * ActiveIngredients -> "Medication.ingredient.item[x]:itemCodeableConcept"
    * ActiveIngredientRoles -> "Medication.ingredient.isActive"
    * ActiveIngredientStrengths -> "Medication.ingredient.strength"
    * PharmaceuticalDoseForm -> "Medication.form.text, Medication.form.coding:kbvDarreichungsform"
    * MedicinalProductPackageDescription -> "Medication.extension:packaging"
    * MedicinalProductPackageIdentifier -> "Medication.extension:packageIdentifier" //TODO: BfArM erfragt system für Identifier
    * PackageType -> "Medication.extension:packaging.value[x]:valueString"
    * PackageSize -> "Medication.amount.numerator.extension:packagingSize"
    * MarketingAuthorizationHolder -> "Medication.manufacturer.display"