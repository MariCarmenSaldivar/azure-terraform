# azure-terraform
Ejemplos de IaC con Terraform para administrar recursos de Azure
Validate git commands
## Folders
#### AzureProvider/example1 
Archivos: 
1. main.tf: en el que tenemos la configuracion de nuestro provedor en este caso azurerm y la configuracion de nuestro blobstorage para guardar ahi nuestro archivo tfstate file, podriamos decir que es el archivo principal.
2. azureVM.tf: crea una azure VM de ubuntu y los elementos de los cuales depende como la subnet, la public ip, la network interface etc.
3. blobandstorage.tf: un container, un blob storage y un file share.
4. mysqlserver.tf: crea un servidor de mysql y una base de datos
5. NSG.tf: crea un network seurity group 
6. recoveryservicevault.tf: creamos un recurso de tipo recovery services vault que es donde almacenamos todos nuestros nuestros 
7. rg.tf: crea nuestro grupo de recursos
8. storageaccount.tf: creamos nuestro storage account que usamos en el archivo blobandstorage.tf
9. terraform.tfvars: nuestro archivo con las variables que usamos en alguno de los archivos
10. vnet-subnet.tf: creamos una virtual network y 2 subnets
11. webapp.tf: creamos un service plan y una app servie ára aplicaciones dotnet

#### datafactorydevenv
Archivos:
1. main.tf: en el que tenemos la configuracion de nuestro provedor en este caso azurerm y la configuracion de nuestro blobstorage para guardar ahi nuestro archivo tfstate file, podriamos decir que es el archivo principal.
2. datafactory.tf: crea nuestro datafactory.
3. sql.tf: crea un servidor de sql y una base de datos con informacion de ejemplo que despues puedes usar para hacer pruebas en tu datafactory pipeline 
4. storage.tf: crea una cuenta de almacenamiento y 2 containers que nos pueden servir como datasets en nuestro datafactory.
5. terraform.tfvars: nuestro archivo con las variables que usamos en alguno de los archivos. 
 delete messages