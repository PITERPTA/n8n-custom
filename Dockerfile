FROM n8nio/n8n

USER root

# Instalacja ffmpeg, python3, pip i curl przez apk (Alpine)
RUN apk update && apk add --no-cache ffmpeg python3 py3-pip curl \
  && pip3 install yt-dlp

# (Opcjonalnie) skopiuj czcionkę, jeśli masz ją w repozytorium
COPY fonts/apercumovistarbold.ttf /usr/share/fonts/truetype/apercumovistarbold.ttf

USER node

ENV N8N_PORT=$PORT
EXPOSE 5678

CMD ["n8n"]
