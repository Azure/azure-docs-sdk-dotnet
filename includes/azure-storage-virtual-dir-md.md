Blob names may simulate a directory structure by including a delimiter character, such as a forward slash (/). A virtual directory is an abstraction provided by the client library to simplify navigating that directory structure. Containers and blobs are Azure resources, with their own endpoints, but a virtual directory is part of a blob name.

For example, suppose you have a blob whose absolute URI is:

```https://storagesample.blob.core.windows.net/sample-container/level1/level2/level3/blob.txt```

The blob name is: 

```level1/level2/level3/blob.txt```

The virtual directories that are part of the blob name are:

-  ```level1/level2/level3/```
-  ```level1/level2/```
-  ```level1/```