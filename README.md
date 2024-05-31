# Frank-docker-example

# Setup local environment
prerequisites:  docker desktop


## ADD FRANK!FLOW
- Download latest version of frank-flow_version war 
- place it in root dir of frank4......
- frank-flow.war

## Start local environment
- Docker compose up to run



#Build version for K8s deployment if upload (you should use CICD to build / test and deploy)

## create a Jar file of your configurations (Not usable wit custom  code, in this case the buidl should be done with maven)
- run build.bat it will create a zipfile with configuration directories
- use the jar file from the builds dir in your K8S helm chart


