FROM haskell:8.10.4

# This Dockerfile adds a non-root user with sudo access. Use the "remoteUser"
# property in devcontainer.json to use it. On Linux, the container user's GID/UIDs
# will be updated to match your local UID/GID (when using the dockerFile property).
# See https://aka.ms/vscode-remote/containers/non-root-user for details.
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Set to false to skip installing zsh and Oh My ZSH!
ARG INSTALL_ZSH="false"

ARG INSTALL_FISHER="true"

RUN apt-get update

COPY library-scripts/common-debian.sh /tmp/library-scripts/
RUN bash /tmp/library-scripts/common-debian.sh "$INSTALL_ZSH" "$USERNAME" "$USER_UID" "$USER_GID"

COPY library-scripts/fish-debian.sh /tmp/library-scripts/
RUN bash /tmp/library-scripts/fish-debian.sh "$INSTALL_FISHER" "$USERNAME"
