# Todo List

1. Convert `setup.md` into a CLI tool
    - This will involve rewriting the existing setup instructions in `setup.md` as a command-line interface (CLI) tool, which can be executed from the terminal.
    - The CLI tool should have both headless and interactive modes, allowing users to choose between automated setup or manual configuration.
    - In headless mode, a configuration file should be required to provide the necessary parameters for the setup process.

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

7. Create the infrastructure and application layers of the application, including the following components:
    - Message broker: Utilize NATS as the messaging system for reliable and scalable communication between services.
    - Caching layer: Implement Redis or an open-source alternative for caching data and improving application performance.
    - Database: Choose between PostgreSQL (pg) or Neon as the database technology for storing and retrieving application data.
    - Storage interface: Consider leveraging the centralized network storage solution mentioned earlier to handle storage requirements.
    - Identity federation: Integrate Keycloak as the identity federation solution to manage authentication and authorization across the application.

    - Check istio for service discovery and service mesh
