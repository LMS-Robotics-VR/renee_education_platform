# renee_education_platform
A Moodle app tailored for RENEE project

Setup Instructions

📦 Prerequisites <br />
        - Docker installed <br />
        - The Moodle docker image: docker.renee-project.eu/v2/myapp:v1  <br />
 <br />
📁 Project Structure
 <br />
   RENEE-moodle/ <br />
   │ <br />
   ├── docker-compose.yml <br />
   ├── Dockerfile <br />
   └── moodle-image.tar <br />
<br />
STEPS <br />
 
 1. Get the image: <br />
    from .tar file into Docker: <br />
            ``` cd ./RENEE-moodle/``` <br />
            ``` docker load -i moodle-image.tar``` <br />
    or pull from Docker Hub: <br />
            ```sudo docker login``` <br />
            ```docker pull docker.renee-project.eu/v2/myapp:v1``` <br />
 
2. Setup Moodle:
  - Go to localhost (port 80)
  - Choose the language: "English (en)"
  - Confirm paths: 
  - Choose database driver: "MariaDB (native/MariaDB)"
  - Database settings: Set all the above.
  - Click continue and Install all the plugins missing.
 
! ATTENTION: This process is prerequisite in case we use different docker image and we have to setup the Moodle from the beginning or the docker's containers were deleted!
 
