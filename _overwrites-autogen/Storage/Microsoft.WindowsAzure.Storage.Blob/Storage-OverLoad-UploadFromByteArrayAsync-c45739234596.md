---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlockBlob.UploadFromByteArrayAsync  
examples: *content  
---  
  
## Examples  
 This code example creates an array of bytes and writes the array to a new block blob.  
  
```c#  
private static async Task UploadByteArrayAsync(CloudBlobContainer container, long numBytes)  
{  
    CloudBlockBlob blob = container.GetBlockBlobReference("byte-array-" + Guid.NewGuid());  
  
    // Write an array of random bytes to a block blob.   
    Console.WriteLine("Write an array of bytes to a block blob");  
    byte[] sampleBytes = new byte[numBytes];  
    Random random = new Random();  
    random.NextBytes(sampleBytes);  
  
    try  
    {  
        await blob.UploadFromByteArrayAsync(sampleBytes, 0, sampleBytes.Length);  
    }  
    catch (StorageException e)  
    {  
        Console.WriteLine(e.Message);  
        Console.ReadLine();  
        throw;  
    }  
}  
  
```