Reference: https://docs.microsoft.com/en-us/learn/modules/aks-governance-azure-policy/3-exercise-enable-azure-policy-for-aks

az provider register --namespace Microsoft.PolicyInsights

az group create --location eastus2 --name AKS_Workshop

az aks create --name AKSCluster-Demo --resource-group AKS_Workshop

az aks enable-addons --addons azure-policy --name AKSCluster-Demo --resource-group IaC_Workshop

------------- Types of Azure Policies for AKS -------------

Cluster policies cover the cluster itself, not the workload running on the cluster. You would configure these policies to enforce cluster configuration. Examples of these policies include Authorized IP ranges should be defined on Kubernetes Services and Role-Based Access Control (RBAC) should be used on Kubernetes Services.

Workload policies cover the applications running in your cluster. Workload policies are used to enforce configuration inside the Kubernetes cluster. These policies rely on the Azure policy for Kubernetes add-on to function correctly. Examples of these policies include Kubernetes cluster containers should only use allowed images and Kubernetes cluster pods should only use allowed volume types.

Discovering built-in Azure policies for Kubernetes

https://docs.microsoft.com/en-us/azure/governance/policy/samples/built-in-policies
https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyMenuBlade/Definitions

------------- Policy initiative: Kubernetes cluster pod security baseline standards for Linux-based workloads -------------

Kubernetes cluster pod security baseline standards for Linux-based workloads: 
https://github.com/Azure/azure-policy/blob/master/built-in-policies/policySetDefinitions/Kubernetes/Kubernetes_PSPBaselineStandard.json

Kubernetes cluster pod security restricted standards for Linux-based workloads: 
https://github.com/Azure/azure-policy/blob/master/built-in-policies/policySetDefinitions/Kubernetes/Kubernetes_PSPRestrictedStandard.json

az aks get-credentials --resource-group IaC_Workshop --name AKSCluster-Demo

kubectl create -f pod-deploy.yaml

kubectl create -f pod-service.yaml

k get all

Allowed container image regex on Azure Portal Policy Configuration
.+\.azurecr\.io/.+$

------------- Assign a policy initiative -------------
Now that you have successfully assigned your policy, you will now assign an initiative before you test the policies. An Azure Policy initiative is a collection of Azure Policy definitions, or rules, that are grouped together towards a specific goal or purpose. Azure initiatives simplify management of your policies by grouping a set of policies together, logically, as a single item.

Initiatives can be assigned the same way policies are assigned. Follow the steps below to assign the "Kubernetes cluster pod security restricted standards for Linux-based workloads" initiative.

Return to the Policy page in Azure portal.
In the left pane of the Azure Policy page, select Definitions.
From the Category dropdown list box, use Select all to clear the filter and then select Kubernetes.
Select the Kubernetes cluster pod security restricted standards for Linux-based workloads initiative definition. Take some time to review the various policies that are a part of the initiative.
Select the Assign button at the top-left corner of the screen.
Set the Scope to the resource group of the Kubernetes cluster you created, which in this case is the videogamerg. Fill out the rest of the form as you did in the previous step and click Review + create.
Click the Create button.

ACR_NAME=<<Name of your ACR>>

az aks update -n AKSCluster-Demo -g IaC_Workshop --attach-acr $ACR_NAME


------------- Check compliance status using Azure Policy  -------------

Go to the Policy page in Azure portal.

Remove the non-compliant pod and recheck compliance

kubectl delete deployment simple-nginx

Review again Policy page in Azure portal
