# Open Telemetry Terraform Code  

The repository contains Terraform code to provision resources required to deploy the OpenTelemetry demo application on Azure.

## Remote backend

A Azure Blob storage is created to store the terraform state file. This keeps the sensitive information locked away from local system.

## Modules

Terraform modules are created for resources.

### Resource Group Module

The module takes in resource group name and location as variable.
Uses the variable to create the resourcegroup on Azure and spits out Name and ID as output.

### VNet Module

The module takes in name, resource group, location, address space and list of subnets as variables.
Creates the required VNet along with defined subnets.
Gives out VNet Name, VNet ID, List of Subnet Name and Subnet IDs as output.

### AKS Module

The module creates an AKS Cluster with 2 nodes (system and user) with public access.
Kubernetes 1.29.2 is deployed using this module.
