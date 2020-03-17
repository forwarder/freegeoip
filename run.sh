#!/bin/sh

mkdir -p /tmp/freegeoip

if [ -n "$FREEGEOIP_CUSTOM_UPDATES_URL" ]; then \
curl -fSLo /tmp/freegeoip/db.gz "${FREEGEOIP_CUSTOM_UPDATES_URL}"; \
fi

# [ -f "/db.gz" ] && cp /db.gz /tmp/freegeoip/db.gz

exec freegeoip -http :${PORT} -use-x-forwarded-for -public /app/cmd/freegeoip/public -quota-backend map -quota-max 10000000