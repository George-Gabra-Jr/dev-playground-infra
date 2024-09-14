# Todo List

1. Convert `setup.md` into a script
    - This will involve rewriting the existing setup instructions in `setup.md` as a script, such as a Bash or Python script, to automate the setup process.
    - The script should include all the necessary commands and configurations required to set up the project environment.

2. Implement Terraform setup for automation
    - Use Terraform to define and provision the required infrastructure resources, such as virtual machines, networks, and storage, needed for the project.
    - Create Terraform configuration files to specify the desired infrastructure state and use Terraform commands to apply the configuration and provision the resources.

3. Explore Docker secrets for secure secret management
    - Investigate Docker secrets as a way to securely store and manage sensitive information, such as API keys, passwords, and certificates, used by the project.
    - Learn how to create and manage Docker secrets, and update the project's Docker Compose or Docker Swarm configuration to use secrets instead of hardcoding sensitive data.

4. Solve DIND as a service problem for Jenkins
    - Address the issue of running Docker in Docker (DIND) as a service for Jenkins.
    - Research and implement a solution to enable Jenkins to use Docker containers for building and testing applications.

5. Explore external service for centralized network storage
    - Investigate external services that provide centralized network storage for volumes.
    - Evaluate options for separating persistence from containers and the host machine by utilizing an external storage solution.

