---  
uid: Microsoft.Azure.Batch.Protocol.IPoolOperations.StopResizeWithHttpMessagesAsync(System.String,Microsoft.Azure.Batch.Protocol.Models.PoolStopResizeOptions,System.Collections.Generic.Dictionary{System.String,System.Collections.Generic.List{System.String}},System.Threading.CancellationToken)  
remarks: *content  
---  
  
## Remarks  
 This does not restore the pool to its previous state before the             resize operation: it only stops any further changes being made,             and the pool maintains its current state.