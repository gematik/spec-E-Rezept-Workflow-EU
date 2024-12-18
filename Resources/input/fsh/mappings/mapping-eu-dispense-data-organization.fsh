Mapping: GEM_ERPEU_MAP_Dispense_Data_Organization
Source: GEM_ERPEU_LOG_DispenseData
Target: "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERPEU_PR_Organization"
Id: GEM-ERPEU-MAP-EU-Data-Organization
Title: "Mapping for EU DispenseData to EU-Organization"
Description: "This mapping maps the logical information of the EU DispenseData to the EU-Organization"
* OrganizationData -> "GEM_ERPEU_PR_Organization"
  * FacilityIdentifier -> "Organization.identifier"
  * OrganizationIdentifier -> "Organization.identifier"
  * OrganizationName -> "Organization.name"
  * StreetAddress -> "Organization.address.line"
  * City -> "Organization.address.city"
  * ZipOrPostalCode -> "Organization.address.postalCode"
  * StateOrProvince -> "Organization.address.state"
  * Country -> "Organization.address.country"