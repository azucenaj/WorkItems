#! /bin/bash
USROBJTID="d9bacd46-e1c3-41ac-9242-615bb6f73f2e"
SUBSCRIPTION="bb8a4cec-66d3-4c74-ac4e-6faf0e7797ba"
RG="Demogrp"
LOCATION="eastus"
SBUS="pubsubdemodaprw"
SBUSTOPIC="orders"
SBUSQUEUE="daprdemow"
AZKEYVAULT="keydaprdemo2"
APPREG="demodaprw"
SECRET="daprdemokey2"
SECRETPASS="ValueofSecretsOn"
STORAGEACCNT="daprstoredemo1"
STORAGECONT="daprcontainerpub1"
REDIS="DaprCache"


#az login --tenant "45777099-9647-4fff-aa49-c9709407eb74" #"a9076f93-d94f-4a10-8289-12bb67840c04"
#az account set -s "d9bacd46-e1c3-41ac-9242-615bb6f73f2e"
az account set -s $SUBSCRIPTION

az group create --name $RG --location $LOCATION #--sku Standard_LRS

#azure service bus
az servicebus namespace create --resource-group $RG --name $SBUS --location eastus
az servicebus queue create --resource-group $RG --namespace-name $SBUS --name $SBUSQUEUE
az servicebus topic create --resource-group $RG --namespace-name $SBUS --name $SBUSTOPIC
az servicebus namespace authorization-rule keys list --resource-group $RG --namespace-name $SBUS --name RootManageSharedAccessKey --query primaryConnectionString --output tsv

#azure key vault
az keyvault create --location $LOCATION --name $AZKEYVAULT --resource-group $RG --enable-rbac-authorization true 
#RGID=$(az group show -n $RG  --query "id" --output tsv)
#az role assignment create --role "Key Vault Administrator" --assignee $USROBJTID  --scope "${RGID}/providers/Microsoft.KeyVault/vaults/$AZKEYVAULT"
#az keyvault secret set --name $SECRET --vault-name $AZKEYVAULT --value $SECRETPASS

#az keyvault create --location "eastus" --name "keydaprdemo41" --resource-group "Demogrp" --enable-rbac-authorization true 
#az keyvault secret set --name "daprdemokeyw" --vault-name "keydaprdemow" --value "ValueofSecrets"
#az role assignment create --role "Key Vault Administrator" --assignee <User accounts Object ID(can be seen on you profile in azure portal), Service Principal(see app registration clis)> --scope < Can be seen in your Key Vault properties as Resource ID e.g."/subscriptions/bb8a4cec-66d3-4c74-ac4e-6faf0e7797ba/resourceGroups/Demogrp/providers/Microsoft.KeyVault/vaults/keydaprdemo7">


#azure storage account
az storage account create -n $STORAGEACCNT -g $RG --kind StorageV2 -l $LOCATION
az storage container create -n $STORAGECONT --public-access blob --account-name $STORAGEACCNT 


#azure redis
az redis create --location $LOCATION --name $REDIS --resource-group $RG --sku Basic --vm-size c0



#azure app registration 
#az ad app create --display-name $APPREG \
#az ad app create --display-name "demodaprw"

# Note: execute the commented commands below after creation of the app
#az ad app credential reset \
#  --id <Get Application (client) ID from your azure portal> --years 2  --password <replace this with your own password>
#az ad sp create \
#  --id <Get Application (client) ID  from your azure portal> 