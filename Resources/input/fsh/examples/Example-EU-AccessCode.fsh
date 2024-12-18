Instance: Example-EU-PermissionRequest
InstanceOf: GEM_ERPEU_PR_PAR_Access_Authorization_Request
Usage: #example
Title: "GEM_ERPEU_PR_PAR_Access_Authorization_Request"
* parameter[countryCode].valueCoding.code = #BE
* parameter[accessCode].valueIdentifier.value = "ABC123"


Instance: Example-EU-PermissionResponse
InstanceOf: GEM_ERPEU_PR_PAR_Access_Authorization_Response
Usage: #example
Title: "GEM_ERPEU_PR_PAR_Access_Authorization_Response"
* parameter[countryCode].valueCoding.code = #BE
* parameter[accessCode].valueIdentifier.value = "ABC123"
* parameter[validUntil].valueInstant = "2025-10-01T13:12:32+02:00"
* parameter[createdAt].valueInstant = "2025-10-01T12:12:32+02:00"

// Invalid Examples to Test Invariants

/*

// Test other characters
Instance: INVALID-workflow-eu-access-code-1-1
InstanceOf: GEM_ERPEU_PR_PAR_Access_Authorization_Request
Usage: #example
Title: "GEM_ERPEU_PR_PAR_Access_Authorization_Request"
* parameter[countryCode].valueCoding.code = #BE
* parameter[accessCode].valueIdentifier.value = "12345-"

// Test length
Instance: INVALID-workflow-eu-access-code-1-2
InstanceOf: GEM_ERPEU_PR_PAR_Access_Authorization_Request
Usage: #example
Title: "GEM_ERPEU_PR_PAR_Access_Authorization_Request"
* parameter[countryCode].valueCoding.code = #BE
* parameter[accessCode].valueIdentifier.value = "123"

*/