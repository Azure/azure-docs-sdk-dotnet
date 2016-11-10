---
uid: 
examples: *content
---
## Examples  
 This code example uploads a new block blob as a set of 256 KB blocks.  
  
```c#  
private static async Task UploadBlobInBlocksAsync(CloudBlobContainer container)  
{  
    // Create an array of random bytes, of the specified size.  
    byte[] randomBytes = new byte[5 * 1024 * 1024];  
    Random rnd = new Random();  
    rnd.NextBytes(randomBytes);  
  
    // Get a reference to a new block blob.  
    CloudBlockBlob blob = container.GetBlockBlobReference("sample-blob-" + Guid.NewGuid());  
  
    // Specify the block size as 256 KB.  
    int blockSize = 256 * 1024;  
  
    MemoryStream msWrite = null;  
  
    // Create new stream of bytes.  
    msWrite = new MemoryStream(randomBytes);  
    msWrite.Position = 0;  
    using (msWrite)  
    {  
        long streamSize = msWrite.Length;  
  
        // Create a list of block IDs.  
        List<string> blockIDs = new List<string>();  
  
        // Indicate the starting block number.  
        int blockNumber = 1;  
  
        try  
        {  
            // The number of bytes read so far.  
            int bytesRead = 0;  
  
            // The number of bytes left to read and upload.  
            long bytesLeft = streamSize;  
  
            // Loop until all of the bytes in the stream have been uploaded.  
            while (bytesLeft > 0)  
            {  
                int bytesToRead;  
  
                // Check whether the remaining bytes constitute at least another block.  
                if (bytesLeft >= blockSize)  
                {  
                    // Read another whole block.  
                    bytesToRead = blockSize;  
                }  
                else  
                {  
                    // There's less than a whole block left, so read the rest of it.  
                    bytesToRead = (int)bytesLeft;  
                }  
  
                // Create a block ID from the block number, and add it to the block ID list.  
                // Note that the block ID is a base64 string.  
                string blockId = Convert.ToBase64String(Encoding.ASCII.GetBytes(string.Format("BlockId{0}", blockNumber.ToString("0000000"))));  
                blockIDs.Add(blockId);  
  
                // Set up a new buffer for writing the block, and read that many bytes into it .  
                byte[] bytesToWrite = new byte[bytesToRead];  
                msWrite.Read(bytesToWrite, 0, bytesToRead);  
  
                // Calculate the MD5 hash of the buffer.  
                MD5 md5 = new MD5CryptoServiceProvider();  
                byte[] blockHash = md5.ComputeHash(bytesToWrite);  
                string md5Hash = Convert.ToBase64String(blockHash, 0, 16);  
  
                // Upload the block with the hash.  
                await blob.PutBlockAsync(blockId, new MemoryStream(bytesToWrite), md5Hash);  
  
                // Increment and decrement the counters.  
                bytesRead += bytesToRead;  
                bytesLeft -= bytesToRead;  
                blockNumber++;  
            }  
  
            // Read the block list that we just created. The blocks will all be uncommitted at this point.  
            await ReadBlockListAsync(blob);  
  
            // Commit the blocks to a new blob.  
            await blob.PutBlockListAsync(blockIDs);  
  
            // Read the block list again. Now all blocks will be committed.  
            await ReadBlockListAsync(blob);  
        }  
        catch (StorageException e)  
        {  
            Console.WriteLine(e.Message);  
            Console.ReadLine();  
            throw;  
        }  
    }  
}  
  
 private static async Task ReadBlockListAsync(CloudBlockBlob blob)  
{  
    // Get the blob's block list.  
    foreach (var listBlockItem in await blob.DownloadBlockListAsync(BlockListingFilter.All, null, null, null))  
    {  
        if (listBlockItem.Committed)  
        {  
            Console.WriteLine(  
                              "Block {0} has been committed to block list. Block length = {1}",  
                              listBlockItem.Name,   
                              listBlockItem.Length);  
        }  
        else  
        {  
            Console.WriteLine(  
                              "Block {0} is uncommitted. Block length = {1}",  
                              listBlockItem.Name,   
                              listBlockItem.Length);  
        }  
    }  
  
    Console.WriteLine();  
}  
  
```