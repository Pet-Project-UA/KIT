# Використовуйте офіційний базовий образ для Python, якщо фронтенд побудовано на Flask або Django для серверного рендерингу
# FROM python:3.8-slim

# Використовуйте офіційний базовий образ для Node.js, якщо ви використовуєте React, Angular, Vue або інший JavaScript фреймворк
# FROM node:14-alpine

# Використовуйте офіційний базовий образ для .NET, якщо ви використовуєте Blazor або інші .NET фреймворки для фронтенда
# FROM mcr.microsoft.com/dotnet/aspnet:5.0

# Встановіть робочу директорію в контейнері
WORKDIR /app

# Скопіюйте файли проекту в контейнер
COPY . .

# Встановіть залежності
# Для Python
# RUN pip install --no-cache-dir -r requirements.txt

# Для Node.js
# RUN npm install

# Для .NET
# RUN dotnet restore

# Побудуйте додаток
# Для Python (запустіть сервер розробки, не рекомендується для продакшена)
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

# Для Node.js (побудувати статичні файли і запустити сервер)
# RUN npm run build
# CMD ["npx", "serve", "-s", "build", "-l", "3000"]

# Для .NET
# RUN dotnet build
# CMD ["dotnet", "run"]

# Відкрийте порт, який використовує веб-сервер
# EXPOSE 8000  # Для Python
# EXPOSE 3000  # Для Node.js
# EXPOSE 5000  # Для .NET
