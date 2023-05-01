# easy-port-forward

docker run -p 443:443 -e LISTEN_PORT=443 -e FORWARD_ADDRESS=your_domain.com:443 -dit easy-port-forward
