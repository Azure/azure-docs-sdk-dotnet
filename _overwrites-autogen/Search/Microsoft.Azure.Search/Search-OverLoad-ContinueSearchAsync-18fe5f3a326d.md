---  
uid: Microsoft.Azure.Search.DocumentsOperationsExtensions.ContinueSearchAsync  
remarks: *content  
---  
  
## Remarks  
 The non-generic overloads of the ContinueSearch, ContinueSearchAsync, and             ContinueSearchWithHttpMessagesAsync methods make a best-effort attempt to map JSON types in the response             payload to .NET types. See             [GetWithHttpMessagesAsync](assetId:///M:Microsoft.Azure.Search.IDocumentsOperations.GetWithHttpMessagesAsync(System.String,System.Collections.Generic.IEnumerable{System.String},Microsoft.Azure.Search.Models.SearchRequestOptions,System.Collections.Generic.Dictionary{System.String,System.Collections.Generic.List{System.String}},System.Threading.CancellationToken)?qualifyHint=False&autoUpgrade=True) for more information.  
  
 If Azure Search can't include all results in a single response, the response returned will include a             continuation token that can be passed to ContinueSearch to retrieve more results.             See `DocumentSearchResultBase.ContinuationToken` for more information.  
  
 Note that this method is not meant to help you implement paging of search results. You can implement             paging using the `Top` and `Skip` parameters to the             `Search` method.  
  
---  
uid: Microsoft.Azure.Search.DocumentsOperationsExtensions.ContinueSearchAsync  
remarks: *content  
---  
  
## Remarks  
 The generic overloads of the ContinueSearch, ContinueSearchAsync, and ContinueSearchWithHttpMessagesAsync             methods support mapping of Azure Search field types to .NET types via the type parameter T. See              [GetWithHttpMessagesAsync<T\>](assetId:///M:Microsoft.Azure.Search.IDocumentsOperations.GetWithHttpMessagesAsync``1(System.String,System.Collections.Generic.IEnumerable{System.String},Microsoft.Azure.Search.Models.SearchRequestOptions,System.Collections.Generic.Dictionary{System.String,System.Collections.Generic.List{System.String}},System.Threading.CancellationToken)?qualifyHint=False&autoUpgrade=True) for more details on the type mapping.  
  
 If Azure Search can't include all results in a single response, the response returned will include a             continuation token that can be passed to ContinueSearch to retrieve more results.             See `DocumentSearchResultBase.ContinuationToken` for more information.  
  
 Note that this method is not meant to help you implement paging of search results. You can implement             paging using the `Top` and `Skip` parameters to the             `Search` method.