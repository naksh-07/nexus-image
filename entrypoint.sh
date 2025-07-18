#!/bin/bash
set -e

# Optional logging
echo "[ENTRYPOINT] Running nexus-node with args: $@"

# Run the binary with passed arguments
exec /usr/local/bin/nexus-node "$@"
