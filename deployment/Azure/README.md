# Розгортання в Azure

Цей файл надає інструкції для розгортання вашого додатку в Microsoft Azure, використовуючи Azure Container Instances (ACI), що є одним із найпростіших способів запуску контейнерів у Azure.

## Передумови

Переконайтеся, що ви маєте:
- Azure акаунт.
- Встановлений і налаштований Azure CLI.

## Кроки для розгортання

1. **Створення контейнерного репозиторію в Azure Container Registry (ACR)**:
   Створіть ACR, який використовуватиметься для зберігання вашого Docker образу.

   ```bash
   az acr create --resource-group myResourceGroup --name myContainerRegistry --sku Basic
   ```

2. **Логін в ACR**:
   Авторизуйте Azure CLI для взаємодії з вашим ACR.

   ```bash
   az acr login --name myContainerRegistry
   ```

3. **Білд і пуш образу**:
   Збілдуйте ваш Docker образ локально та завантажте його в ACR.

   ```bash
   az acr build --registry myContainerRegistry --image my-app-backend .
   ```

4. **Створення контейнерної групи в Azure Container Instances**:
   Розгорніть ваш образ з ACR у ACI, забезпечуючи швидке розгортання.

   ```bash
   az container create --resource-group myResourceGroup --name myContainerInstance --image myContainerRegistry.azurecr.io/my-app-backend:latest --cpu 1 --memory 1.5 --registry-login-server myContainerRegistry.azurecr.io --registry-username <acr-username> --registry-password <acr-password> --dns-name-label my-app-backend --ports 80
   ```

5. **Перевірка статусу контейнера**:
   Переконайтеся, що ваш контейнер запущено та працює коректно.

   ```bash
   az container show --resource-group myResourceGroup --name myContainerInstance --query "{FQDN:ipAddress.fqdn,ProvisioningState:provisioningState}" --out table
   ```

## Моніторинг

Використовуйте Azure Monitor для стеження за станом вашого контейнера та отримання логів з вашого додатку.

```bash
az monitor activity-log list --resource-group myResourceGroup
```

Слідуючи цим інструкціям, ви зможете ефективно розгортати та моніторити ваші додатки в Microsoft Azure, використовуючи переваги облачного розгортання з використанням контейнерів.
