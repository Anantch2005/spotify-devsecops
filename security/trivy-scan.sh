#!/bin/bash

IMAGE=$1

echo "🔐 Running Trivy scan on $IMAGE"
trivy image --severity HIGH,CRITICAL $IMAGE
