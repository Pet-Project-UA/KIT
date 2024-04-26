# Розгортання в AWS

Цей файл містить інструкції для розгортання вашого додатку у сервісах Amazon Web Services (AWS). Розгортання в AWS включає кілька основних кроків, які дозволять вам ефективно використовувати хмарні ресурси.

## Передумови

Переконайтеся, що ви маєте:
- AWS акаунт.
- Встановлений і налаштований AWS CLI.
- Права доступу для створення і управління AWS сервісами.

## Кроки для розгортання

1. **Створення ECR репозиторію**:
   Використовуйте AWS Elastic Container Registry для зберігання вашого Docker образу.

   ```bash
   aws ecr create-repository --repository-name my-app-backend
   ```

2. **Авторизація Docker до ECR**:
   Авторизуйте вашу Docker CLI для взаємодії з вашим ECR.

   ```bash
   aws ecr get-login-password --region region | docker login --username AWS --password-stdin account-id.dkr.ecr.region.amazonaws.com
   ```

3. **Білд і пуш образу**:
   Білдуйте ваш Docker образ і завантажте його в ECR.

   ```bash
   docker build -t my-app-backend .
   docker tag my-app-backend:latest account-id.dkr.ecr.region.amazonaws.com/my-app-backend:latest
   docker push account-id.dkr.ecr.region.amazonaws.com/my-app-backend:latest
   ```

4. **Розгортання за допомогою ECS**:
   Використовуйте Amazon Elastic Container Service (ECS) або Amazon Elastic Kubernetes Service (EKS) для розгортання вашого образу.

   - **ECS**:
     ```bash
     # Створення нового ECS task definition та запуск у класері
     aws ecs create-task-definition --cli-input-json file://task-definition.json
     aws ecs run-task --cluster my-cluster --task-definition my-app-backend
     ```


## Моніторинг та логування

Використовуйте AWS CloudWatch для моніторингу та логування стану вашого додатку в хмарі. Це дозволить вам відстежувати роботу додатку та швидко реагувати на можливі проблеми.

```bash
aws cloudwatch get-metric-statistics --namespace AWS/ECS --metric-name CPUUtilization --statistics Average --period 300
```
