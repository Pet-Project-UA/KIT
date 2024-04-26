# Використовуємо офіційний образ Nginx на базі Alpine
FROM nginx:alpine

# Видаляємо стандартний конфігураційний файл Nginx
RUN rm /etc/nginx/conf.d/default.conf

# Копіюємо наші статичні файли з папки designs у папку, звідки Nginx буде їх роздавати
COPY ./designs /usr/share/nginx/html

# Копіюємо наш конфігураційний файл Nginx з папки src у директорію Nginx
COPY ./src/nginx.conf /etc/nginx/nginx.conf

# Відкриваємо 80 порт для зовнішнього доступу
EXPOSE 80

# Запускаємо Nginx в фоновому режимі
CMD ["nginx", "-g", "daemon off;"]
