---
uid: 
remarks: *content
---
---
uid: 
examples: *content
---
## Remarks  
 Each client instance caches the last sequence number and unless explicitly indicated, uses that sequence number to peek the next message. For example, if you peek all messages in a queue (in batches, providing the `fromSequenceNumber` parameter), and then peek with no parameter, the method returns no messages.  
  
 `PeekBatch` does not always return the number of messages specified in the [MessageCount Property](assetId:///P:Microsoft.ServiceBus.Messaging.QueueDescription.MessageCount?qualifyHint=False&autoUpgrade=True). There are two common reasons for this.  One reason is that the aggregated size of the collection of messages exceeds the maximum size of 256KB.  Another reason is that if the queue or topic has the [EnablePartitioning Property](assetId:///P:Microsoft.ServiceBus.Messaging.QueueDescription.EnablePartitioning?qualifyHint=False&autoUpgrade=True) set to `true`, a partition may not have enough messages to complete the requested number of messages.     In general, if an application wants to receive a specific number of messages, it should call `PeekBatch` repeatedly until it gets that number of messages, or there are no more messages to peek.  
  
## Examples  
 The following examples show how to use the `PeekBatch` method to get a specific number of messages, and how to use `PeekBatch` to receive all messages.  To start from the beginning, the `fromSequenceNumber` parameter should be set to 0.  
  
```  
static async Task<IEnumerable<BrokeredMessage>> PeekAllAsync(QueueClient qc, long fromSequenceNumber)  
{  
    const int batchSize = 100;  
    List<BrokeredMessage> messages = new List<BrokeredMessage>();  
  
    var peekedMessages = await qc.PeekBatchAsync(fromSequenceNumber, batchSize);  
    bool hasMessages = peekedMessages != null && peekedMessages.Any();  
   if (hasMessages)  
    {  
        messages.AddRange(peekedMessages);  
    }  
  
    while (hasMessages)  
    {  
        peekedMessages = await qc.PeekBatchAsync(batchSize);  
        hasMessages = peekedMessages != null && peekedMessages.Any();  
        if (hasMessages)  
        {  
            messages.AddRange(peekedMessages);  
        }  
    }   
  
    return messages;  
}  
```  
  
```  
static async Task<IEnumerable<BrokeredMessage>> PeekBatchAsync(QueueClient qc, int fromSequenceNumber, int messageCount)  
{  
    List<BrokeredMessage> messages = new List<BrokeredMessage>();  
  
    var peekedMessages = await qc.PeekBatchAsync(fromSequenceNumber, messageCount);  
    bool hasMessages = peekedMessages != null && peekedMessages.Any();  
    if (hasMessages)  
    {  
        messages.AddRange(peekedMessages);  
    }  
  
    while (hasMessages && messages.Count < messageCount)  
    {  
        peekedMessages = await qc.PeekBatchAsync(messageCount - messages.Count);  
        hasMessages = peekedMessages != null && peekedMessages.Any();  
        if (hasMessages)  
        {  
            messages.AddRange(peekedMessages);  
        }  
    }   
  
    return messages;  
}  
```  
  
```  
static IEnumerable<BrokeredMessage> PeekAll(QueueClient qc, long fromSequenceNumber)  
{  
    const int batchSize = 100;  
  
    var peekedMessages = qc.PeekBatch(fromSequenceNumber, batchSize);  
    bool hasMessages = peekedMessages != null && peekedMessages.Any();  
    if (hasMessages)  
    {  
        foreach (var peekedMessage in peekedMessages)  
        {  
            yield return peekedMessage;  
        }  
    }  
  
    while (hasMessages)  
    {  
        peekedMessages = qc.PeekBatch(batchSize);  
        hasMessages = peekedMessages != null && peekedMessages.Any();  
        if (hasMessages)  
        {  
            foreach (var peekedMessage in peekedMessages)  
            {  
                yield return peekedMessage;  
            }  
        }  
    }  
}  
  
```  
  
```  
static IEnumerable<BrokeredMessage> PeekBatch(QueueClient qc, int fromSequenceNumber, int messageCount)  
{  
    int peekedMessageCount = 0;  
    var peekedMessages = qc.PeekBatch(fromSequenceNumber, messageCount);  
    bool hasMessages = peekedMessages != null && peekedMessages.Any();  
    if (hasMessages)  
    {  
        foreach (var peekedMessage in peekedMessages)  
        {  
            peekedMessageCount++;  
            yield return peekedMessage;  
        }  
    }  
  
    while (hasMessages && peekedMessageCount < messageCount)  
    {  
        peekedMessages = qc.PeekBatch(messageCount - peekedMessageCount);  
        hasMessages = peekedMessages != null && peekedMessages.Any();  
        if (hasMessages)  
        {  
            foreach (var peekedMessage in peekedMessages)  
            {  
                peekedMessageCount++;  
                yield return peekedMessage;  
            }  
        }  
    }  
}  
  
```