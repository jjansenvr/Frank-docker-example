# Local frank development environment with Docker

## Setup local environment
Prerequisites:  docker desktop

### Add Frank!Flow
- **Download :**
  latest version of frank-flow_version war
- **place in :**
  root dir of your project
- **rename to :**
  frank-flow.war

### Start local environment
- use `Docker compose up` to start the docker image


### XSD for typeahead and configuration validation in VSCode
the frankrunner automates downloading the of the 
- open the frankdoc http://localhost:8080/iaf/frankdoc/#/All
- download xsd to your local configurations dir








==========================================================================================================
# kubernetes stuff




## deploy to your local K8S cluster

### Build a config jar for K8s deployment
I have added a `build.bat` file that will package (zip) your configurations dir in a jar format. It will have a unique name

```
**Disclaimer** 
This approach is only suitable for local use. 
It will not work with custom code, in this case a proper maven build is needed) 

```

### create a Jar file of your configurations (Not usable wit custom  code, in this case the build should be done using maven)
- run build.bat it will create a zipfile with configuration directories
- use the jar file from the builds dir in your K8S helm chart

```
apiVersion: frankframework.org/v1
kind: Frank
metadata:
  name: frank-docker-example
  namespace: frank-docker-example
spec:
  containerImage: nexus.frankframework.org/frankframework
  imageVersion: 8.2.0-SNAPSHOT
  replicas: 1
  resourcesMap:
    frank2test: file://C/git/Frank-docker-example/builds/Frank-docker-example_2024-05-31_14-15-56.jar
  envVarsMap:
    example-env-var: value
  labelsMap:
    example-label: label
  podManager: Deployment
```
