# Розгортання в Google Cloud Platform (GCP)

Цей файл містить інструкції для розгортання вашого додатку в Google Cloud Platform за допомогою Google Cloud Run, що дозволяє запускати контейнери без необхідності управління кластерами Kubernetes.

## Передумови

Переконайтеся, що ви маєте:
- GCP акаунт.
- Встановлений і налаштований Google Cloud SDK.

## Кроки для розгортання

1. **Створення контейнерного репозиторію в Google Container Registry (GCR)**:
   Створіть GCR, який буде використовуватись для зберігання вашого Docker образу.

   ```bash
   gcloud artifacts repositories create my-container-repo --repository-format=docker --location=us-central1 --description="Docker repository"
   ```

2. **Авторизація gcloud**:
   Налаштуйте gcloud для роботи з GCR.

   ```bash
   gcloud auth configure-docker us-central1-docker.pkg.dev
   ```

3. **Білд і пуш образу**:
   Збілдуйте ваш Docker образ локально та завантажте його в GCR.

   ```bash
   gcloud builds submit --tag us-central1-docker.pkg.dev/my-project/my-container-repo/my-app-backend
   ```

4. **Розгортання образу в Google Cloud Run**:
   Розгорніть ваш образ з GCR у Cloud Run.

   ```bash
   gcloud run deploy my-app-backend --image us-central1-docker.pkg.dev/my-project/my-container-repo/my-app-backend --platform managed --region us-central1 --allow-unauthenticated
   ```

5. **Перевірка статусу сервісу**:
   Переконайтеся, що ваш сервіс запущено та доступний.

   ```bash
   gcloud run services describe my-app-backend --format="value(status.url)"
   ```

## Моніторинг

Використовуйте Google Cloud Monitoring для стеження за станом вашого сервісу та отримання важливої інформації про трафік і здоров'я контейнера.

```bash
gcloud monitoring dashboards list
```

Слідуючи цим інструкціям, ви зможете швидко розгортати та моніторити ваші додатки у Google Cloud Platform, використовуючи контейнеризацію для ефективного розгортання.
