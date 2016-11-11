---  
uid: Microsoft.Azure.Batch.ODATADetailLevel.FilterClause  
remarks: *content  
---  
  
## Remarks  
 This is an optional OData $filter expression string             (see the OData specification).             For example, you can restrict a [ListPools](assetId:///M:Microsoft.Azure.Batch.PoolOperations.ListPools(Microsoft.Azure.Batch.DetailLevel,System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior})?qualifyHint=False&autoUpgrade=True) operation to return             only active pools with the expression `state eq 'active'`.  
  
 Filters must be specified using REST API attribute names, not .NET property names.  
  
 The default is no filter expression, which means all resources are returned.