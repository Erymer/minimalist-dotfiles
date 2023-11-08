FROM alpine

LABEL maintainer="Erymer"

COPY . /minimalist_dotfiles
WORKDIR /minimalist_dotfiles

EXPOSE 8000

RUN apk add --update --no-cache make bash vim zsh tmux && \
    adduser \
      --disabled-password \
      alpine-user

USER alpine-user
