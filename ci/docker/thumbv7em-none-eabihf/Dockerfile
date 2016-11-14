FROM ubuntu:16.04
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    gcc \
    gcc-arm-none-eabi \
    git \
    libc6-dev
RUN curl -LSfs https://japaric.github.io/trust/install.sh | \
    sh -s -- --crate rustfmt --git japaric/rustfmt-bin --tag v0.6.2-20161114 --target x86_64-unknown-linux-gnu --to /usr/bin
RUN curl -LSfs https://japaric.github.io/trust/install.sh | \
    sh -s -- --git japaric/svd2rust --tag v0.1.1 --target x86_64-unknown-linux-gnu --to /usr/bin
RUN curl -LSfs https://japaric.github.io/trust/install.sh | \
    sh -s -- --git japaric/xargo --tag v0.2.1 --target x86_64-unknown-linux-gnu --to /usr/bin
