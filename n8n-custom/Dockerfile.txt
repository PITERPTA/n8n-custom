FROM n8nio/n8n

USER root

# Zainstaluj yt-dlp i ffmpeg
RUN apt-get update \
  && apt-get install -y ffmpeg python3-pip curl \
  && pip3 install yt-dlp

# (Opcjonalnie) jeśli masz czcionkę, skopiuj ją:
COPY fonts/apercumovistarbold.ttf /usr/share/fonts/truetype/apercumovistarbold.ttf

USER node
