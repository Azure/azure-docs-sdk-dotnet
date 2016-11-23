---  
uid: Microsoft.ServiceBus.Messaging.EventHubConsumerGroup.CreateReceiver  
remarks: *content  
---  
  
## Remarks  
 [EventHubReceiver](assetId:///T:Microsoft.ServiceBus.Messaging.EventHubReceiver?qualifyHint=False&autoUpgrade=True) objects created from these methods represent a receiver connected to a specific partition in an Event Hub.  
  
---  
uid: Microsoft.ServiceBus.Messaging.EventHubConsumerGroup.CreateReceiver  
examples: *content  
---  
  
## Examples  
 The following code creates a receiver that receives events from the first partitions of the default consumer group. It uses a previously stored offset as the starting offset and returns that event as the first event, assuming you have obtained the description that specifies the partition IDs. Also, the code assumes that you have retrieved the stored offset.  
  
```c#  
EventHubDescription description;  
string storedOffset = "2478";  
  
EventHubClient client = EventHubClient.CreateFromConnectionString(connection);  
var defaultGroup = client.GetDefaultConsumerGroup();  
var receiver = defaultGroup.CreateReceiver(  
    description.PartitionIds.First(),   
    storedOffset);  
  
// eventData will have offset == storedOffset  
var eventData = receiver.Receive();  
```