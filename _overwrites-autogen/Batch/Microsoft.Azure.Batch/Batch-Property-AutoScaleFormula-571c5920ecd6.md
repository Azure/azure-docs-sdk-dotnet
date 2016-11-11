---  
uid: Microsoft.Azure.Batch.CloudPool.AutoScaleFormula  
remarks: *content  
---  
  
## Remarks  
 For how to write autoscale formulas, see https://azure.microsoft.com/documentation/articles/batch-automatic-scaling/.              This property is required if [AutoScaleEnabled](assetId:///P:Microsoft.Azure.Batch.CloudPool.AutoScaleEnabled?qualifyHint=False&autoUpgrade=True) is set to true. It must be null if AutoScaleEnabled              is false.  
  
 The formula is checked for validity before the pool is created. If the formula is not valid,              an exception is thrown when you try to commit the [CloudPool](assetId:///T:Microsoft.Azure.Batch.CloudPool?qualifyHint=False&autoUpgrade=True).