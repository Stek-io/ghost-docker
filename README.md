# ghost-docker
Scripts and dockerfiles required to build Ghost docker images.

* `build-ghost.sh`: Checks out and builds Ghost from Stek.io's Repo and stek.io branch.
* `build-image.sh`: Builds Ghost image
* `start-ghost.sh`: Default command used within the Docker Container

# Build a new Ghost Docker Image

1. Build Ghost: Run the following command to build Ghost: `./build-ghost.sh <tag to build>`
2. Build Docker image: Run the following command to build a Docker image: `./build-image.sh -t <docker image ful name> .`
3. Push upstream: `docker push` (you will need to be logged in the Docker Hub repository;
do `docker login` to start a Docker login prompt)

Example:

* `./build-ghost.sh 1.0.0-alpha.19`
*  `./build-image.sh -t stek/ghost:1.0.0-alpha.19`
*  `docker push`

