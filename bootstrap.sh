#!/bin/bash

# Створення структури директорій
mkdir -p docs/{design,technical,meetings} \
         src/{frontend/{public,src},backend/{api,models,services},shared} \
         tests/{frontend,backend} \
         designs \
         deployment/{AWS,Azure,GCP} \
         scripts \
         .github/{ISSUE_TEMPLATE}

# Створення файлів
touch docker-compose.yml \
      .dockerignore \
      Dockerfile \
      .gitignore \
      README.md \
      .github/CODEOWNERS \
      .github/FUNDING.yml \
      .github/PULL_REQUEST_TEMPLATE.md \
      .github/ISSUE_TEMPLATE/01_BUG_REPORT.md \
      .github/ISSUE_TEMPLATE/02_FEATURE_REQUEST.md \
      .github/ISSUE_TEMPLATE/03_CODEBASE_IMPROVEMENT.md \
      .github/ISSUE_TEMPLATE/04_SUPPORT_QUESTION.md \
      .github/ISSUE_TEMPLATE/config.yml \
      docs/CODE_OF_CONDUCT.md \
      docs/CONTRIBUTING.md \
      docs/SECURITY.md \
      docs/participants.md \
      docs/design/logo.png

echo "Структура проєкту та необхідні файли були успішно створені."
