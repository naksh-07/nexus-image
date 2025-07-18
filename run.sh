NODE_ID="13018975"

docker run -dit \
  --name nexus-node \
  --network host \
  rohan014233/nexus-image \
  start --node-id "$NODE_ID"
