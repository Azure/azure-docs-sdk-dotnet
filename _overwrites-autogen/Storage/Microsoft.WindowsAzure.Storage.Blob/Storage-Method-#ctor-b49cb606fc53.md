---
uid: 
remarks: *content
---
## Remarks  
 If the generated policy is to be used for encryption, users are expected to provide a key at the minimum.             The absence of key will cause an exception to be thrown during encryption.  
 If the generated policy is intended to be used for decryption, users can provide a key resolver. The client library will:  
 1. Invoke the key resolver, if specified, to get the key.  
 2. If resolver is not specified but a key is specified, the client library will match the key ID against the key and use the key.