# my-qa-project



This repository contains a script to automate the testing of the communication between frontend and backend services deployed in a Kubernetes cluster.

## Prerequisites

Before running the tests, ensure you have the following installed:
 ```
- [Docker](https://www.docker.com/get-started)
- [Minikube](https://minikube.sigs.k8s.io/docs/start/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- Bash environment (e.g., Git Bash or WSL on Windows)
 ```

## Setup Instructions

Follow these steps to set up your environment and deploy the services:

1. **Start Minikube**:  
  To Make sure your Kubernetes cluster is running:
   ```bash
   minikube start
    ```
2.**Deploy Frontend and Backend Services**:
   I ensured that i have Kubernetes manifests ready to deploy them . ( Took reference from https://github.com/Vengatesh-m/qa-test/tree/main/Deployment)
   ```
  kubectl apply -f frontend-deployment.yaml
  kubectl apply -f backend-deployment.yaml
   ```
3.**Get Pods Information**
   I verifed that pods are working for both frontend and backend 
   ```
   kubectl get pods

   ```
4.**Verify Service Availability**:
   ```
   minikube service frontend-service

   ```

  ![Screenshot](Screenshot%202024-09-25%20223542.png)
### Automated Testing 
I uses Bash script language for automated testing

1.**Make the Test Script Executable**
  Before running the test, I needed to make that the test script is executable

  ```
  chmod +x test_script.sh
  ```
2.**Run the Test Script**:

  ```
  ./test_script.sh

  ```
3**Screenshot of the Script**:

 ![Screenshot](Screenshot (18).png)




   
