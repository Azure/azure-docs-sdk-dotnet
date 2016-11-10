---
uid: 
remarks: *content
---
## Remarks  
 The Job Preparation task is always rerun if a compute node is reimaged, or if the Job Preparation task did not              complete (e.g. because the reboot occurred while the task was running). Therefore, you should always write a              Job Preparation task to be idempotent and to behave correctly if run multiple times. If this property is not              specified, a default value of true is assigned by the Batch service.