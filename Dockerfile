FROM n8nio/n8n

USER root

# Zainstaluj potrzebne pakiety i yt-dlp
RUN apk update && apk add --no-cache ffmpeg python3 py3-pip curl \
  && pip3 install --break-system-packages --root-user-action=ignore yt-dlp

# Skopiuj czcionkę
COPY fonts/apercumovistarbold.ttf /usr/share/fonts/truetype/apercumovistarbold.ttf

COPY cookies/cookies.txt /app/cookies.txt

USER node

# Ustaw zmienne środowiskowe
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV N8N_PORT=5678

EXPOSE 5678

# Przywróć oryginalny entrypoint i komendę
ENTRYPOINT ["tini", "--"]
CMD ["n8n"]
