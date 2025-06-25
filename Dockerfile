FROM node:20-alpine

# Ustaw katalog roboczy
WORKDIR /app

# Zainstaluj zależności systemowe
RUN apk add --no-cache ffmpeg python3 py3-pip curl

# Zainstaluj yt-dlp
RUN pip3 install --break-system-packages --root-user-action=ignore yt-dlp

# Zainstaluj n8n globalnie
RUN npm install -g n8n

# (Opcjonalnie) skopiuj czcionkę, jeśli masz
COPY fonts/apercumovistarbold.ttf /usr/share/fonts/truetype/apercumovistarbold.ttf

# Zmienna środowiskowa portu
ENV N8N_PORT=5678
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

EXPOSE 5678

CMD ["n8n"]
