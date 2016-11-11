---  
uid: Microsoft.Azure.Batch.JobOperations.AddTaskAsync(System.String,Microsoft.Azure.Batch.CloudTask,System.Collections.Concurrent.ConcurrentDictionary{System.Type,Microsoft.Azure.Batch.IFileStagingArtifact},System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior},System.Threading.CancellationToken)  
remarks: *content  
---  
  
## Remarks  
 Each call to this method incurs a request to the Batch service. Therefore, using this method to add             multiple tasks is less efficient than using a bulk add method, and can incur HTTP connection restrictions.             If you are performing many of these operations in parallel and are seeing client side timeouts, please see              http://msdn.microsoft.com/en-us/library/system.net.servicepointmanager.defaultconnectionlimit%28v=vs.110%29.aspx             or use the multiple-task overload of AddTaskAsync.  
  
 The add task operation runs asynchronously.