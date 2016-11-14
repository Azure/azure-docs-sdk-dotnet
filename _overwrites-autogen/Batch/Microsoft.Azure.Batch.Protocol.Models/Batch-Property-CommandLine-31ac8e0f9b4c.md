---  
uid: Microsoft.Azure.Batch.Protocol.Models.CloudTask.CommandLine  
remarks: *content  
---  
  
## Remarks  
 For multi-instance tasks, the command line is executed on the             primary subtask after all the subtasks have finished executing             the coordianation command line. The command line does not run             under a shell, and therefore cannot take advantage of shell             features such as environment variable expansion. If you want to             take advantage of such features, you should invoke the shell in             the command line, for example using "cmd /c MyCommand" in Windows             or "/bin/sh -c MyCommand" in Linux.