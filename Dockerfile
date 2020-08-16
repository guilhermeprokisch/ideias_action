FROM alpine/git:latest

LABEL "maintainer"="Guilherme Prokisch <guilherme@prokis.ch>"
LABEL "com.github.actions.name"="ideias-action"
LABEL "com.github.actions.description"="Action to prepare the ideas repository requeriments"
LABEL "com.github.actions.icon"="book-open"
LABEL "com.github.actions.color"="black"

RUN apk add --no-cache bash findutils
COPY entrypoint.sh /
COPY backlinks.sh /
RUN chmod +x /entrypoint.sh
RUN chmod +x /backlinks.sh

ENTRYPOINT ["/entrypoint.sh"]
