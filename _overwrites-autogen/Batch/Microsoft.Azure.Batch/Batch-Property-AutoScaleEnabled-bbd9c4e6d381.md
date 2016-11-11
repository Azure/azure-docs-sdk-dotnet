---  
uid: Microsoft.Azure.Batch.CloudPool.AutoScaleEnabled  
remarks: *content  
---  
  
## Remarks  
 If false, the [TargetDedicated](assetId:///P:Microsoft.Azure.Batch.CloudPool.TargetDedicated?qualifyHint=False&autoUpgrade=True) property is required, and [AutoScaleFormula](assetId:///P:Microsoft.Azure.Batch.CloudPool.AutoScaleFormula?qualifyHint=False&autoUpgrade=True) must              be null.  
  
 If true, the [AutoScaleFormula](assetId:///P:Microsoft.Azure.Batch.CloudPool.AutoScaleFormula?qualifyHint=False&autoUpgrade=True) property is required, and [TargetDedicated](assetId:///P:Microsoft.Azure.Batch.CloudPool.TargetDedicated?qualifyHint=False&autoUpgrade=True) must be null. The pool automatically resizes according to the formula.  
  
 The default value is false.