FROM n8nio/n8n

USER root

# Instalacja zależności
RUN apt-get update \
  && apt-get install -y ffmpeg python3-pip curl \
  && pip3 install yt-dlp

# (Opcjonalnie) czcionka – jeśli masz plik fonts/apercumovistarbold.ttf
# COPY fonts/apercumovistarbold.ttf /usr/share/fonts/truetype/apercumovistarbold.ttf

USER node

# Ustaw port (Render go wymaga)
ENV N8N_PORT=$PORT
EXPOSE 5678

# Komenda startowa
CMD ["n8n"]
