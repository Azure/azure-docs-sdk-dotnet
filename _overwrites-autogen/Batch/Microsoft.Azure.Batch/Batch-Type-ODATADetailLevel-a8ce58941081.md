---  
uid: Microsoft.Azure.Batch.ODATADetailLevel  
remarks: *content  
---  
  
## Remarks  
 Azure Batch supports OData queries, which allow the client to gain finer control over query              performance by controlling which resources are returned in List operations ([FilterClause](assetId:///P:Microsoft.Azure.Batch.ODATADetailLevel.FilterClause?qualifyHint=False&autoUpgrade=True)),              and which properties of each resource are returned in List, Get or Refresh operations              ([SelectClause](assetId:///P:Microsoft.Azure.Batch.ODATADetailLevel.SelectClause?qualifyHint=False&autoUpgrade=True) and [ExpandClause](assetId:///P:Microsoft.Azure.Batch.ODATADetailLevel.ExpandClause?qualifyHint=False&autoUpgrade=True)).  
  
 By default, if you do not pass a [DetailLevel](assetId:///T:Microsoft.Azure.Batch.DetailLevel?qualifyHint=False&autoUpgrade=True) to a List, Get or Refresh operation,              the Batch client specifies no filter (all records are returned), no select clause (all simple properties are              returned) and no expand clause (associated entities are not returned).  Consequently, by default, associated entity              properties are null, rather than being populated like other properties.  Refer to individual class              documentation to find out which properties are considered associated entities and need to be expanded              to be populated.  
  
 Because the OData queries are passed directly to the REST API, clause strings must use the JSON attribute              names from the REST API, which are not always the same as .NET property names.  For example, the              .NET [VirtualMachineSize](assetId:///P:Microsoft.Azure.Batch.CloudPool.VirtualMachineSize?qualifyHint=False&autoUpgrade=True) property corresponds to              the vmSize attribute in the REST API; therefore, to filter a pool list operations by VM size, you would              need to write vmSize rather than VirtualMachineSize in your filter string.  Refer to the REST API              documentation to find out the JSON attribute name corresponding to a .NET property.  
  
 For additional information about using OData to efficiently query the Azure Batch service, see              Efficient List Queries on MSDN.  
  
---  
uid: Microsoft.Azure.Batch.ODATADetailLevel  
examples: *content  
---  
  
## Examples  
 This sample shows how to specify an ODataDetailLevel that lists only active [CloudPool](assetId:///T:Microsoft.Azure.Batch.CloudPool?qualifyHint=False&autoUpgrade=True),              and retrieves only the [Id](assetId:///P:Microsoft.Azure.Batch.CloudPool.Id?qualifyHint=False&autoUpgrade=True), [DisplayName](assetId:///P:Microsoft.Azure.Batch.CloudPool.DisplayName?qualifyHint=False&autoUpgrade=True) and [Statistics](assetId:///P:Microsoft.Azure.Batch.CloudPool.Statistics?qualifyHint=False&autoUpgrade=True) for each pool (for example, for display in a reporting user interface).  
  
```  
  
var detailLevel = new ODATADetailLevel(  
    filterClause: "state eq 'active'",  
    selectClause: "id,displayName,stats",  
    expandClause: "stats"  
);  
  
var pools = batchClient.PoolOperations.ListPools(detailLevel);  
  
```