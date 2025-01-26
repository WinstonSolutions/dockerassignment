# Codin 1 Website Development Environment

This document provides instructions on how to run the "Codin 1" website using Docker.

## Prerequisites

- Docker Desktop must be installed on your Windows machine.

## Steps to Run

1.  **Navigate to the project directory:**
     ```bash
      cd my-app
     ```

2.  **Build the Docker Image:**

     ```bash
     docker build -t lastName_firstName_coding_assignment11 .
     ```
     (Replace `lastName_firstName` with your last and first name in pinyin)

3.  **Run the Docker Container:**

     ```bash
     docker run -d -p 7775:7775 --name lastName_firstName_coding_assignment11 lastName_firstName_coding_assignment11
     ```
     (Replace `lastName_firstName` with your last and first name in pinyin)

4.  **Access the Website:**

     Open your web browser and go to [http://127.0.0.1:7775](http://127.0.0.1:7775). You should see the "Codin 1" message.

## Dockerfile Explanation

The `Dockerfile` sets up a development environment with the following steps:

1. Uses a Node.js base image.
2. Sets up the working directory `/lastName_firstName_site`.
3. Copies `package.json` and `package-lock.json` to the working directory and installs dependencies.
4. Copies the rest of the React app code and builds it.
5. Uses nginx base image to serve the build files.
6. Exposes port 7775.
7. Runs the nginx server.

## Notes

- The container is named "lastName_firstName_coding_assignment11".
- The website is hosted in the workdir named "lastName_firstName_site".
- Ensure that no other application is using port 7775 on your host machine.