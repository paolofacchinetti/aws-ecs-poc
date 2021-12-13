# aws-ecs-poc

Questa repository serve da esempio per un semplice webserver containerizzato e successivamente deployato su AWS ECS.

Gli step sono i seguenti:

- Creazione di repository ECR su AWS ECR
- Creazione di utente IAM di tipo "programmatic access", con permessi necessari per push sulla repository ECR. Salvare le sue access key ID e secret access key.
- [Creazione di ruolo IAM ecsInstanceRole](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/instance_IAM_role.html)
- Setup di ECS: creare un cluster, un service, una task definition e [collegare istanza EC2](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_container_instance.html)
- [Setup GitHub actions per CI -> ECR e CD -> ECS](https://docs.github.com/en/actions/deployment/deploying-to-your-cloud-provider/deploying-to-amazon-elastic-container-service)
