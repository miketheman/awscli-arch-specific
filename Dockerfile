FROM debian:bookworm-slim
ARG TARGETPLATFORM

# The minimal requirements to download and install the AWS CLI, as well as run `help`
RUN apt-get update && \
    apt-get install --no-install-recommends -y ca-certificates curl groff less unzip && \
    rm -rf /var/lib/apt/lists/*

RUN case ${TARGETPLATFORM} in \
    "linux/amd64") ARCH=x86_64 ;; \
    "linux/arm64") ARCH=aarch64 ;; \
  esac && \
  curl -fsSL https://awscli.amazonaws.com/awscli-exe-linux-${ARCH}-2.15.24.zip -o awscliv2.zip && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip ./aws
