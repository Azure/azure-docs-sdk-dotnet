---  
uid: Microsoft.Azure.Batch.JobOperations.ListNodeFiles(System.String,System.String,System.Nullable{System.Boolean},Microsoft.Azure.Batch.DetailLevel,System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior})  
remarks: *content  
---  
  
## Remarks  
 This method returns immediately; the file data is retrieved from the Batch service only when the collection is enumerated.             Retrieval is non-atomic; file data is retrieved in pages during enumeration of the collection.