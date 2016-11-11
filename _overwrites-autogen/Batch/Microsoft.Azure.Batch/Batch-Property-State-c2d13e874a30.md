---  
uid: Microsoft.Azure.Batch.JobPreparationTaskExecutionInformation.State  
remarks: *content  
---  
  
## Remarks  
 Running means the task is currently running. Completed means the task has completed. The Completed state includes              the case where the task exits successfully with exit code 0 and the cases where the system fails to start the              task process due to scheduling errors or the retry limit has reached after numerous task failures.