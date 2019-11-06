docker-images
=============

Repository for building generic base / helper images used in the City of
Helsinki docker infrastructure.

Readily runnable docker images
------------------------------

Take a look at https://hub.docker.com/u/helsinkitest

Prerequisites
-------------

TODO: running this in shell is not yet supported.
- docker (sudo apt install docker.io)
- gitlab-runner (sudo apt install gitlab-runner)

Configuration
-------------

In order for the builder definitions to work, you need to define:
- `CI_REGISTRY`: where to log in, for pushing images
- `CI_REGISTRY_IMAGE`: common prefix for image names
- `CI_REGISTRY_USER` and `CI_REGISTRY_PASSWORD`: for logging in for push

Other points of information
---------------------------

- Issue backlog: This repository is developed as part of the City of
  Helsinki culture and leisure services DevOps project:
  https://helsinkisolutionoffice.atlassian.net/secure/RapidBoard.jspa?rapidView=32&projectKey=DEVOPS&view=planning.nodetail
- Build monitor: https://gitlab.com/City-of-Helsinki/KuVa/docker-images/-/jobs
- Internal documentation page: https://helsinkisolutionoffice.atlassian.net/wiki/spaces/DD/pages/37453829/DevOps+development+project

How to contribute
-----------------

Please make a pull request and contact kuva-devops@googlegroups.com to
ensure it's reviewed in some sprint.

