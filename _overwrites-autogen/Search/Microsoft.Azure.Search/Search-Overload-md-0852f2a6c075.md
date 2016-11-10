---
uid: 
remarks: *content
---
## Remarks  
 The non-generic overloads of the Search, SearchAsync, and SearchWithHttpMessagesAsync methods make a             best-effort attempt to map JSON types in the response payload to .NET types. See             [Microsoft.Azure.Search](assetId:///N:Microsoft.Azure.Search?qualifyHint=False&autoUpgrade=True) for more information.  
  
 If Azure Search can't include all results in a single response, the response returned will include a             continuation token that can be passed to ContinueSearch to retrieve more results.             See `DocumentSearchResultBase.ContinuationToken` for more information.  
  
## Remarks  
 The generic overloads of the Search, SearchAsync, and SearchWithHttpMessagesAsync methods support mapping             of Azure Search field types to .NET types via the type parameter T. See              [IDocumentsOperations Interface](assetId:///T:Microsoft.Azure.Search.IDocumentsOperations?qualifyHint=False&autoUpgrade=True) for more details on the type mapping.  
  
 If Azure Search can't include all results in a single response, the response returned will include a             continuation token that can be passed to ContinueSearch to retrieve more results.             See `DocumentSearchResultBase.ContinuationToken` for more information.