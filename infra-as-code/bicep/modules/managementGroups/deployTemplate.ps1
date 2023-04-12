az login
az account list -o table
az account set --subscription 'b715762f-8402-42bb-8cca-52f26f9356c8'
az deployment tenant create --name 'DeployUsingBicep' --location 'eastus2' --template-file .\infra-as-code\bicep\modules\managementGroups\managementGroups.bicep
az logout

az bicep update

MGID="alz"

# Chosen Azure Region
LOCATION="eastus"

dateYMD=$(date +%Y%m%dT%H%M%S%NZ)
NAME="alz-CustomRoleDefsDeployment-${dateYMD}"
TEMPLATEFILE="infra-as-code/bicep/modules/customRoleDefinitions/customRoleDefinitions.bicep"
PARAMETERS="@infra-as-code/bicep/modules/customRoleDefinitions/parameters/customRoleDefinitions.parameters.all.json"

az deployment mg create --name 'CustomRoleUsingBicep' --location 'eastus2' --management-group-id 'MG-Bicep-Deployment' --template-file .\infra-as-code\bicep\modules\customRoleDefinitions\customRoleDefinitions.bicep --parameters .\infra-as-code\bicep\modules\customRoleDefinitions\parameters\customRoleDefinitions.parameters.all.json
