FROM n8nio/n8n

USER root

# Używamy apk bo to alpine, instalujemy potrzebne pakiety i yt-dlp z ignorowaniem ostrzeżeń
RUN apk update && apk add --no-cache ffmpeg python3 py3-pip curl \
  && pip3 install --break-system-packages --root-user-action=ignore -U yt-dlp

# Skopiuj czcionkę
COPY fonts/apercumovistarbold.ttf /usr/share/fonts/truetype/apercumovistarbold.ttf

# Skopiuj cookies do /tmp (tam yt-dlp ma pewnie lepsze uprawnienia do zapisu)
COPY cookies/cookies.txt /tmp/cookies.txt

# Ustaw uprawnienia do pliku cookies (tylko właściciel może czytać i pisać)
RUN chmod 600 /tmp/cookies.txt

USER node

# Zmienne środowiskowe
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV N8N_PORT=5678

EXPOSE 5678

ENTRYPOINT ["tini", "--"]
CMD ["n8n"]
