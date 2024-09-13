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

4. Consider turning services into swarm mode for orchestration
    - Evaluate the benefits of using Docker Swarm mode for orchestration and management of the project's services.
    - Explore the possibility to utilize swarm features like service scaling, rolling updates, and load balancing.

5. Evaluate services for replication and scalability
    - Analyze the project's services to identify which ones can benefit from replication for improved scalability and high availability.
    - Consider factors such as service dependencies, resource utilization, and expected traffic patterns to determine which services should be replicated.
