# Kompetenskväll

## Deploy Azure resources using Bicep

### Agenda

1. What is Bicep and what it isn't
2. Benefits of Bicep
3. Development tools
4. Organizing your code
5. Deployment

### Recommended tools for the Kompetenskväll

1. [Azure Subscription](https://azure.microsoft.com/sv-se/free)
2. [Azure CLI](https://learn.microsoft.com/sv-se/cli/azure/install-azure-cli)
3. [VS Code](https://code.visualstudio.com/)
4. [Bicep extension for VS Code](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.visualstudiobicep)

Alternatively, this repository contains a Devcontainer that sets up all the necessary tooling.

### Cheatsheet

#### Log in via Azure CLI

```bash
az login
```

#### Switch to `Free Trial` subscription

```bash
az account set --subscription "Free Trial"
```

#### Create resource group

```bash
az group create --location "North Europe" --name <NAME>
```

#### Preview Bicep template changes

```bash
az deployment group what-if --resource-group <RESOURCE_GROUP> --template-file <BICEP_FILE> --parameters @params.json param1=value2
```

#### Deploy Bicep template to resource group

```bash
az deployment group create --resource-group <RESOURCE_GROUP> --template-file <BICEP_FILE> --parameters @params.json param1=value2
```

#### Convert ARM template to Bicep

```bash
az bicep decompile --file <ARM_TEMPLATE_JSON>
```