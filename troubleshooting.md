# Authentication or sync doesn't work
Authentication with valid credentials doesn't work. Synchronization doesn't work.

```
https://shlokas.app/db/user_a9dcf8da-4efe-55d3-aeec-f7205f13b788/

401 Unauthorized
```

**Solution:**
CouchDB has lost its configurations. You have to reconfigure it again.
```sh
~/shlokas-server/aux# docker compose -f ./docker-compose.aux.yml -f ./docker-compose.aux.prod.yml up
```

# SSL Certificate has expired
Update and copy certificates. Restart server.

```sh
sudo certbot renew

cp /etc/letsencrypt/live/shlokas.app/fullchain.pem ./_data/balancer/server.crt
cp /etc/letsencrypt/live/shlokas.app/privkey.pem ./_data/balancer/server.key

./shlokas.run.sh prod
```
