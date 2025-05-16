#!/bin/bash

# This script patches the Argo server deployment to set the auth mode to server.
# This is useful when you want to disable authentication for the Argo UI.
kubectl patch deployment argo-server -n argo --type='json' \
  -p='[{
          "op": "replace",
          "path": "/spec/template/spec/containers/0/args",
          "value": ["server", "--auth-mode=server"]
      }]'
