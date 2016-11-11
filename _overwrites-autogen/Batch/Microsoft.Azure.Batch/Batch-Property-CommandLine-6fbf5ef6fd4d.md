---  
uid: Microsoft.Azure.Batch.CloudTask.CommandLine  
remarks: *content  
---  
  
## Remarks  
 The command line does not run under a shell, and therefore cannot take advantage of shell features such as environment              variable expansion. If you want to take advantage of such features, you should invoke the shell in the command              line, for example using "cmd /c MyCommand" in Windows or "/bin/sh -c MyCommand" in Linux.