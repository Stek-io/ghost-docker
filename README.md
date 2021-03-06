# ghost-docker
Scripts and dockerfiles required to build Ghost docker images.

* `build-ghost.sh`: Checks out and builds Ghost from Stek.io's repo.
* `build-image.sh`: Builds Ghost image
* `start-ghost.sh`: Default command used within the Docker Container

# Build a new Ghost Docker Image

Before building make sure you have the latest node 4 installed, e.g.

    nvm install 4
    nvm use 4

1. Build Ghost: Run the following command to build Ghost: `./build-ghost.sh <tag to build>`
2. Build Docker image: Run the following command to build a Docker image: `./build-image.sh -t <docker image full name> .`
3. Push upstream: `docker push` (you will need to be logged in the Docker Hub repository;
do `docker login` to start a Docker login prompt)

Example:

    ./build-ghost.sh 1.0.0-alpha.19
    ./build-image.sh -t stek/ghost:1.0.0-alpha.19 . # mind the dot!
    docker login
    docker push stek/ghost:1.0.0-alpha.19

