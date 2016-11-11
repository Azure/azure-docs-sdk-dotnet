---  
uid: Microsoft.Azure.Batch.SynchronousMethodExceptionBehavior  
remarks: *content  
---  
  
## Remarks  
 By default, synchronous methods throw the same exceptions as asynchronous ones.  For compatability with versions              of the Azure.Batch client prior to 4.0, you can specify the [ThrowAggregateException](assetId:///F:Microsoft.Azure.Batch.SynchronousMethodExceptionBehavior.ThrowAggregateException?qualifyHint=False&autoUpgrade=True) behavior to wrap exceptions              thrown from synchronous methods in an [AggregateException](assetId:///T:System.AggregateException?qualifyHint=False&autoUpgrade=True).