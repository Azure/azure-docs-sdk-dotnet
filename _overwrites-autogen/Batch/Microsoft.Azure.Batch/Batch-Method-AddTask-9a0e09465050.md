---
uid: 
remarks: *content
---
## Remarks  
 Each call to this method incurs a request to the Batch service. Therefore, using this method to add             multiple tasks is less efficient than using a bulk add method, and can incur HTTP connection restrictions.             If you are performing many of these operations in parallel and are seeing client side timeouts, please see              http://msdn.microsoft.com/en-us/library/system.net.servicepointmanager.defaultconnectionlimit%28v=vs.110%29.aspx             or use JobOperations.AddTask.  
  
 This is a blocking operation. For a non-blocking equivalent, see [CloudJob](assetId:///T:Microsoft.Azure.Batch.CloudJob?qualifyHint=False&autoUpgrade=True).