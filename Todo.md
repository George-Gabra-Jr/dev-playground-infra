# Todo List

1. Convert `setup.md` into a script
    - This will involve rewriting the existing setup instructions in `setup.md` as a script, such as a Bash or Python script, to automate the setup process.
    - The script should include all the necessary commands and configurations required to set up the project environment.

2. Implement Terraform setup for automation
    - Use Terraform to define and provision the required infrastructure resources, such as virtual machines, networks, and storage, needed for the project.
    - Create Terraform configuration files to specify the desired infrastructure state and use Terraform commands to apply the configuration and provision the resources.

3. Explore Docker secrets/configs for secure and distributed secret and config management
    - Investigate Docker secrets/configs as a way to securely store and manage sensitive information, such as API keys, passwords, and certificates, used by the project.
    - Learn how to create and manage Docker secrets/configs, and update the project's Docker Compose or Docker Swarm configuration to use secrets/configs instead of hardcoding sensitive data.

4. Address the vulnerability of connecting the host Docker sock to multiple services, including Jenkins.
    - Find a solution to mitigate the security risks associated with sharing the Docker socket between multiple services, such as Jenkins.
    - Research best practices for securely connecting Docker engine to Jenkins for building and testing applications.

5. Explore external service for centralized network storage
    - Investigate external services that provide centralized network storage for volumes.
    - Evaluate options for separating persistence from containers and the host machine by utilizing an external storage solution.

6. Explore Loki logging driver for docker and send logs to the LGTM stack
    - Research the Loki logging driver for Docker and its integration with the LGTM stack.
    - Learn how to configure and use the Loki logging driver to send container logs to the LGTM stack for centralized log management and analysis.
