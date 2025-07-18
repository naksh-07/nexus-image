# Use official Ubuntu 24.04 as base
FROM ubuntu:24.04

# Metadata
LABEL maintainer="your-name@example.com" \
      version="1.0" \
      description="Nexus Node Docker Image"

# Environment settings
ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

# Install dependencies (minimal set)
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    tzdata \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Create user for security (no root usage)
RUN useradd -m -s /bin/bash nexususer

# Create working directory
WORKDIR /app

# Copy binary and set permissions
COPY nexus-network-linux-x86_64 /usr/local/bin/nexus-node

RUN chmod +x /usr/local/bin/nexus-node && chown nexususer:nexususer /usr/local/bin/nexus-node

# Copy entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Switch to non-root user
USER nexususer

# Default entrypoint
ENTRYPOINT ["/entrypoint.sh"]
