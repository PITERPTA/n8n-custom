FROM n8nio/n8n

USER root

RUN apk update && apk add --no-cache ffmpeg python3 py3-pip curl \
  && pip3 install --break-system-packages --root-user-action=ignore yt-dlp

# Jeśli potrzebujesz czcionki, odkomentuj to i wrzuć plik do repo
COPY fonts/apercumovistarbold.ttf /usr/share/fonts/truetype/apercumovistarbold.ttf

USER node

ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV N8N_PORT=5678

EXPOSE 5678

CMD ["n8n"]
