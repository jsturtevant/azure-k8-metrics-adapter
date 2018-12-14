#!/bin/bash

if [[ ! -v SP_TENANT_ID ]] || [[ ! -v SP_CLIENT_ID]] || [[ ! -v SP_CLIENT_SECRET ]]; then
    echo "Must set SP_TENANT_ID, SP"
    exit 1
fi

echo "Deploying metrics adapter..."
cd $GOPATH/src/github.com/Azure/azure-k8s-metrics-adapter/
helm install --name adapter \
    ./charts/azure-k8s-metrics-adapter \
    --set azureAuthentication.method=clientSecret \
    --set azureAuthentication.tenantID=$SP_TENANT_ID \
    --set azureAuthentication.clientID=$SP_CLIENT_ID \
    --set azureAuthentication.clientSecret=$SP_CLIENT_SECRET \
    --set azureAuthentication.createSecret=true