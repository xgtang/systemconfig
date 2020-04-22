docker run \
    --name dnsmasq \
    -d \
    -p 53:53/udp \
    -p 8080:8080 \
    -v /opt/dnsmasq.conf:/etc/dnsmasq.conf \
    -e "HTTP_USER=admin" \
    -e "HTTP_PASS=admin" \
    --restart always \
    jpillora/dnsmasq
