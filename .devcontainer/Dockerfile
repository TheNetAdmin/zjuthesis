# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.222.0/containers/ubuntu/.devcontainer/base.Dockerfile

# [Choice] Ubuntu version (use hirsuite or bionic on local arm64/Apple Silicon): hirsute, focal, bionic
ARG VARIANT="ubuntu-22.04"
FROM mcr.microsoft.com/vscode/devcontainers/base:${VARIANT}

# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends texlive-full \
    && sudo git clone https://github.com/Haixing-Hu/latex-chinese-fonts /usr/share/fonts/latex-chinese-fonts
