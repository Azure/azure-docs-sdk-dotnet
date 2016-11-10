---
uid: 
remarks: *content
---
## Remarks  
 This is an optional OData $expand expression string             (see the OData specification).             Properties containing associated entities will be null unless included in an ExpandClause.             Specifically, if you perform a List, Get or Refresh and do not specify an ExpandClause, then all associated             entity properties will be null.  For example, if you perform a [Microsoft.Azure.Batch](assetId:///N:Microsoft.Azure.Batch?qualifyHint=False&autoUpgrade=True) operation without an ExpandClause then the [Statistics](assetId:///P:Microsoft.Azure.Batch.CloudPool.Statistics?qualifyHint=False&autoUpgrade=True) property will be null.  To populate             the Statistics property you must supply an ExpandClause of `stats`.  Refer to individual class             documentation to find out which properties are considered associated entities.  
  
 If you specify both an ExpandClause and a [SelectClause](assetId:///P:Microsoft.Azure.Batch.ODATADetailLevel.SelectClause?qualifyHint=False&autoUpgrade=True), then properties listed in the             ExpandClause must be repeated in the SelectClause (because only properties listed in the SelectClause are             included in the service response).  (This requirement does not arise if you do not specify a SelectClause, because that             means 'include all properties in the response.')  
  
 Expansions must be specified using REST API attribute names, not .NET property names.  
  
 The default is no expand expression, which means no associated objects are returned (and the             corresponding properties are null).