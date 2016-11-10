---
uid: 
remarks: *content
---
## Remarks  
 For  applications at scale, buffer pooling is a useful strategy that allows clients to re-use existing buffers across many operations. In a managed environment such as .NET, this can dramatically reduce the number of cycles spent allocating and subsequently garbage collecting semi-long lived buffers.  
  
 The BufferManager property on the service client enables clients to leverage a given buffer pool with any objects associated with the service client instance. For example, all objects of type CloudBlobContainer created via CloudBlobClient.GetContainerReference() would make use of the associated service client's BufferManager. The IBufferManager interface is patterned after the BufferManager class in System.ServiceModel.dll to allow desktop clients to easily leverage an existing implementation provided by the framework. (Clients running on other platforms such as Windows Runtime or Windows Phone may implement a pool against the IBufferManager interface).  
  
 For desktop applications to leverage the built in BufferManager provided by the System.ServiceModel.dll a simple adapter is required:  
  
```c#  
using Microsoft.WindowsAzure.Storage;  
using System.ServiceModel.Channels;  
  
public class WCFBufferManagerAdapter : IBufferManager  
{  
   private int defaultBufferSize = 0;  
  
   public WCFBufferManagerAdapter(BufferManager manager, int defaultBufferSize)  
   {  
       this.Manager = manager;  
       this.defaultBufferSize = defaultBufferSize;  
   }  
  
   public BufferManager Manager { get; internal set; }  
  
   public void ReturnBuffer(byte[] buffer)  
   {  
       this.Manager.ReturnBuffer(buffer);  
   }  
  
   public byte[] TakeBuffer(int bufferSize)  
   {  
       return this.Manager.TakeBuffer(bufferSize);  
   }  
  
   public int GetDefaultBufferSize()  
   {  
       return this.defaultBufferSize;  
   }  
}  
```  
  
 With this in place, an application can specify a shared buffer pool across any resource associated with a the service client by simply setting the BufferManager property.  
  
```c#  
BufferManager mgr = BufferManager.CreateBufferManager([MaxBufferPoolSize], [MaxBufferSize]);  
  
serviceClient.BufferManager = new WCFBufferManagerAdapter(mgr, [MaxBufferSize]);  
```