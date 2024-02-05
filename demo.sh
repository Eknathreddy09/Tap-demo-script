#!/usr/bin/env bash

# Load helper functions and set initial variables
vendir sync
. ./vendir/demo-magic/demo-magic.sh
export TYPE_SPEED=50
export DEMO_PROMPT="${GREEN}➜ ${CYAN}\W ${COLOR_RESET}"
TEMP_DIR="TAP-Demo"
PROMPT_TIMEOUT=20
workloadstatus=$(tanzu apps workload list -n tap-workload -o json | jq ' .[] | select(.metadata.name == "spring-app")' | jq length)
if [ $workloadstatus > '0' ];
    then
        x=$(tanzu apps workload delete spring-app -n tap-workload -y)
else
    echo "Welcome to TAP Demo"
fi
accstatus=$(kubectl get accelerator -n accelerator-system -o=jsonpath='{.items[?(@.metadata.name=="demo-accelerator")].metadata.name}')
if [ $accstatus = 'demo-accelerator' ];
    then
        y=$(tanzu accelerator delete demo-accelerator)
else
    echo "Press Enter"
fi
# Function to pause and clear the screen
function talkingPoint() {
  wait
  clear
}

#Get the status of the Tanzu Application Platform package repository
function packageListRepository() {
  displayMessage "Get the Tanzu Application Platform package repository"
  pei "tanzu package repository list --namespace tap-install"
}

#List the available packages
function packageListAvailable() {
  displayMessage "List the available packages"
  pei "tanzu package available list --namespace tap-install"
}

#List version information for the package by running
function tapPackageList() {
  displayMessage "List version information for the package by running"
  pei "tanzu package available list tap.tanzu.vmware.com --namespace tap-install"
}

#Verify the package install by running
function packageTapInstall() {
  displayMessage "Verify the package install by running"
  pei "tanzu package installed get tap -n tap-install"
}

# List the packages from tap-install Namespace
function packageListInstall() {
  displayMessage "List the packages from tap-install Namespace"
  pei "tanzu package installed list -n tap-install"
}

# List the workload in all Namespaces
function getWorkload() {
  displayMessage "List the workload in all Namespaces"
  pei "tanzu apps workload list -A"
}

# Get specific workload details
function javaWorkload() {
  displayMessage "Get details of tanzu-java-web-app workload"
  pei "tanzu apps workload get tanzu-java-web-app -n tap-workload"
}

# Here is the supplychain looks like
function listSupplyChain() {
  displayMessage "Here is the supplychain looks like in Dev Portal"
#  pei "open demo-1.png"
  pei "open https://tap-gui.demo.vmwareexploreindia.com/supply-chain"
}

# Get specific workload details
function javainuiWorkload() {
  displayMessage "How the Java workload looks like in Dev portal"
  pei "open demo-2.png"
}

# Get specific workload details
function javainuiWorkload1() {
  displayMessage "Soure Scanner in Dev portal"
  pei "open demo-3.png"
}

# Get specific workload details
function javainuiWorkload2() {
  displayMessage "Image Builder in Dev Portal"
  pei "open demo-4.png"
}

# Get specific workload details
function javainuiWorkload3() {
  displayMessage "Image Scanner in Dev Portal"
  pei "open demo-5.png"
}

# Get specific workload details
function javainuiWorkload4() {
  displayMessage "App Delivery in Dev Portal"
  pei "open demo-6.png"
}

# Get specific workload details
function securityAnalysis() {
  displayMessage "Security Analysis in Dev Portal"
  pei "open demo-7.png"
}

## Get specific workload details
#function customPlugins() {
#  displayMessage "Add Custom Plugins in Dev Portal"
#  pei "open demo-8.png"
#}

## Accelerators
#function showAccelerator() {
#  displayMessage "Accelerators"
#  pei "open demo-9.png"
#}

# Accelerators
function showAccelerator() {
  displayMessage "List the Accelerators"
  pei "tanzu accelerator list"
}

# Accelerators
function createAccelerator() {
  displayMessage "Create a new Accelerator"
  pei "tanzu accelerator create demo-accelerator --git-repository https://github.com/Eknathreddy09/battleships-nodejs --git-branch master --display-name battleship-app"
}

# Accelerators
function findAccelerator() {
  displayMessage "List the Accelerators"
  pei "tanzu accelerator list"
}

# Accelerators get demo-accelerator
function getAccelerator() {
  displayMessage "Get the Accelerators Info"
  pei "tanzu accelerator get demo-accelerator"
}

# Service Class
function serviceClass() {
  displayMessage "Discover services"
  pei "tanzu service class list"
}

# Discover more about a class
function rdsClass() {
  displayMessage "Discover details about RDS class from Amazon Web Services"
  pei "tanzu service class get postgresql-managed-aws"
}

# Discover more about a class
function mysqlClass() {
  displayMessage "Discover details about mysql class from VMware Application Catalog"
  pei "tanzu service class get mysql-vac"
}

# Create workload
function createWorkload() {
  displayMessage "Create a simple app"
  pei "tanzu apps workload create spring-app --git-repo https://github.com/explore-india-booth/spring-tap-petclinic --git-branch accelerator  --label apps.tanzu.vmware.com/has-tests=true --label app.kubernetes.io/part-of=petclinic-server --type web  -n tap-workload --yes"
}

#Check the workload
function checkWorkload() {
  displayMessage "Check the Created workload"
  pei "tanzu apps workload get spring-app -n tap-workload"
}

# Monitor the workload status
function tailWorkload() {
  displayMessage "Monitor the workload"
  pei "tanzu apps workload tail spring-app --since 10m -n tap-workload"
}

# Monitor the workload status
function podWorkload() {
  displayMessage "List the pods created in tap-workload namespace"
  pei "kubectl get pods -n tap-workload"
}

# Out of the Box Supply Chain With Testing and Scanning is installed
function listSupplychain() {
  displayMessage "Verify the OOTB Supply Chain With Testing and Scanning is installed"
  pei "tanzu apps cluster-supply-chain list"
}

# List the Scan policy
function scanPolicy() {
  displayMessage "List the Scan policy"
  pei "kubectl get scanpolicy -n tap-workload"
}

# List the Pipeline
function pipeLine() {
  displayMessage "List the Tekton Pipelines"
  pei "kubectl get pipeline -n tap-workload"
}

# List the Deliverables
function deliverable() {
  displayMessage "List the Deliverables"
  pei "kubectl get deliverable -A"
}

# List the Cluster Source Templates
function clusterSourceTemplate() {
  displayMessage "List the Cluster Source Templates"
  pei "kubectl get ClusterSourceTemplate"
}

# List the Cluster Image Templates
function clusterImageTemplate() {
  displayMessage "List the Cluster Image Templates"
  pei "kubectl get ClusterImageTemplate"
}

# List the Cluster Config Templates
function clusterConfigTemplate() {
  displayMessage "List the Cluster Config Templates"
  pei "kubectl get ClusterconfigTemplate"
}

# List the Cluster Deployment Templates
function ClusterDeploymentTemplate() {
  displayMessage "List the Cluster Deployment Templates"
  pei "kubectl get ClusterDeploymentTemplate"
}

# List the Cluster Templates
function clusterTemplate() {
  displayMessage "List the Cluster Templates"
  pei "kubectl get ClusterTemplate"
}

# Display a message with a header
function displayMessage() {
  echo "#### $1"
  echo ""
}

# Main execution flow

talkingPoint
packageListRepository
talkingPoint
#packageListAvailable
#talkingPoint
#tapPackageList
#talkingPoint
packageTapInstall
talkingPoint
packageListInstall
talkingPoint
getWorkload
talkingPoint
javaWorkload
talkingPoint
listSupplyChain
talkingPoint
#javainuiWorkload
#talkingPoint
#javainuiWorkload1
#talkingPoint
#javainuiWorkload2
#talkingPoint
#javainuiWorkload3
#talkingPoint
#javainuiWorkload4
#talkingPoint
#securityAnalysis
#talkingPoint
#customPlugins
#talkingPoint
showAccelerator
talkingPoint
createAccelerator
talkingPoint
findAccelerator
talkingPoint
getAccelerator
talkingPoint
serviceClass
talkingPoint
rdsClass
talkingPoint
mysqlClass
talkingPoint
createWorkload
talkingPoint
checkWorkload
talkingPoint
tailWorkload
talkingPoint
podWorkload
talkingPoint
listSupplychain
talkingPoint
scanPolicy
talkingPoint
pipeLine
talkingPoint
deliverable
talkingPoint
clusterSourceTemplate
talkingPoint
clusterImageTemplate
talkingPoint
clusterConfigTemplate
talkingPoint
ClusterDeploymentTemplate
talkingPoint
clusterTemplate
talkingPoint
