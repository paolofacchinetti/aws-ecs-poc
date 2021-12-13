# aws-ecs-poc

Questa repository serve da esempio per un semplice webserver containerizzato e successivamente deployato su AWS ECS tramite la CI/CD di GitHub Actions.

## Servizi utilizzati

- AWS:
  - ECR (Elastic Container Registry)
  - EC2
  - ECS (Elastic Container Service)
- GitHub Actions

## Setup

- Creazione di repository ECR su AWS ECR.
- Creazione di utente IAM di tipo "programmatic access", con permessi necessari per push sulla repository ECR. Salvare le sue access key ID e secret access key.
- [Creazione di ruolo IAM ecsInstanceRole](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/instance_IAM_role.html)
- Setup di ECS:
  - creare un cluster
  - creare un service: importante attivare il flag `Force new deployment` per permettere la sostituzione di un vecchio service con uno nuovo
  - creazione di task definition: specificare port-mappings delle porte utilizzate dalla nostra applicazione (i.e. 80 (hostport) : 8080 (containerport))
  - [aggiunta di un istanza EC2 al cluster](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_container_instance.html) (NB: nel security group dell'istanza EC2, abilitare il traffico "inbound" per le porte utilizzate dalla nostra applicazione ed esposte precedentemente nei port-mappings della task definition)
- [Setup GitHub actions per CI -> ECR e CD -> ECS](https://docs.github.com/en/actions/deployment/deploying-to-your-cloud-provider/deploying-to-amazon-elastic-container-service)

A questo punto la nostra applicazione sarà raggiungibile all'IP dell'istanza EC2 che abbiamo aggiunto al cluster ECS + la sua porta specificata nel port-mapping della task definition.

### Sviluppi successivi e scaling

Per scalare la nostra applicazione è possibile o aumentare le risorse dedicate al container (CPU/MEMORIA), quindi uno scaling di tipo verticale, o aumentare il numero di container su cui viene deployata la nostra applicazione. In tal caso sarà necessario utilizzare un LoadBalancer per lo smistamento del carico sulle varie istanze ed assicurarsi che le nostre istanze siano stateless.
