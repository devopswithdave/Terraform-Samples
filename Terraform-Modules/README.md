## Using Terraform modules

After using terraform for any period of time you will realise that you will be repeating the same process over 
and over again, especially for the most common resources. To avoid this constant repitition, you can create what is called a Terraform module to assist you with this repetition. 

[Blog post here](TBC)


#!/bin/bash

RESOURCE_GROUP_NAME=tfstate
STORAGE_ACCOUNT_NAME=tfstate$RANDOM
CONTAINER_NAME=tfstate

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location eastus

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME