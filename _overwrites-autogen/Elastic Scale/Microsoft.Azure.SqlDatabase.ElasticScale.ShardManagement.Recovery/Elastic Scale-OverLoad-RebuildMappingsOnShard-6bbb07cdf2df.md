---  
uid: Microsoft.Azure.SqlDatabase.ElasticScale.ShardManagement.Recovery.RecoveryManager.RebuildMappingsOnShard  
remarks: *content  
---  
  
## Remarks  
 Note that this method can cause unrecoverable data loss. Make sure you have taken backups or copies               of your databases and only then proceed with great care.                           Only shard ranges with inconsistencies can be rebuilt using this method. All ranges with no inconsistencies between              the local shard and the global shard map will be kept intact on the local shard and are not affected by this call.              Subsequent changes to the non-conflicting mappings can be made later using the regular interfaces in the shard map manager.               It is not necessary to use the recovery manager to change non-conflicting mappings.