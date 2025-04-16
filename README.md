# renee_education_platform
A Moodle app tailored for RENEE project

## Setup Instructions

📦 Prerequisites
- Docker installed
- The Moodle docker image: docker.renee-project.eu/v2/myapp:v1 

📁 Project Structure

      RENEE-moodle 
      │ 
      ├── docker-compose.yml 
      ├── Dockerfile 
      └── moodle-image.tar 
\
STEPS 
 
 1. Get the image: 
      - from .tar file into Docker: \
            ``` cd ./RENEE-moodle/``` \
            ``` docker load -i moodle-image.tar``` 
      - or pull from Docker Hub: \
            ```sudo docker login``` \
            ```docker pull docker.renee-project.eu/v2/myapp:v1``` 
 
3. Setup Moodle:
      - Go to localhost (port 80)
      - Choose the language: "English (en)"
      - Confirm paths: 
      - Choose database driver: "MariaDB (native/MariaDB)"
      - Database settings: Set all the above.
      - Click continue and Install all the plugins missing.
\
! ATTENTION: This process is prerequisite in case we use different docker image and we have to setup the Moodle from the beginning or the docker's containers were deleted!
 
