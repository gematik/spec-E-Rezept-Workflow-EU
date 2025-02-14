Profile: GEM_ERPEU_PR_PAR_PATCH_Task_Batch_Input
Parent: Parameters
Id: GEM-ERPEU-PR-PAR-EU-PATCH-Task-Batch-Input
Title: "GEM_ERPEU_PR_PAR_PATCH_Task_Batch_Input"
Description: "This profile defines the parameters for patching the Task to mark the prescription as to-be-redeemed in the EU"
* insert Profile(GEM_ERPEU_PR_PAR_PATCH_Task_Batch_Input)

* parameter 1..* MS

* parameter ^slicing.discriminator.type = #pattern
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed

* parameter contains 
  taskInfo 1..*

* parameter[taskInfo]
  * name MS
  * name = "taskInfo"
  * value[x] 0..0
  * resource 0..0
  * part MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "name"
    * ^slicing.rules = #closed
  * part contains
    prescription-id 1..1 MS and
    eu-isRedeemableByPatientAuthorization 1..1 MS
  * part[prescription-id]
    * name MS
    * name = "prescription-id"
    * value[x] 1..1
    * value[x] only Identifier
    * valueIdentifier only GEM_ERP_PR_PrescriptionId
    * resource 0..0
    * part 0..0
  * part[eu-isRedeemableByPatientAuthorization]
    * name MS
    * name = "eu-isRedeemableByPatientAuthorization"
    * value[x] 1..1
    * value[x] only boolean
    * resource 0..0
    * part 0..0
  

