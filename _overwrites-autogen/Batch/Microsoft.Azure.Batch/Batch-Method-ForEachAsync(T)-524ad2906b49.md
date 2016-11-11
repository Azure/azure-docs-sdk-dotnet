---  
uid: Microsoft.Azure.Batch.PagedEnumerableExtensions.ForEachAsync``1(Microsoft.Azure.Batch.IPagedEnumerable{``0},System.Func{``0,System.Threading.Tasks.Task},System.Threading.CancellationToken)  
remarks: *content  
---  
  
## Remarks  
 This method processes elements sequentially, not concurrently.  That is, for each element in the             sequence, the method awaits the asynchronous delegate before processing the next element.