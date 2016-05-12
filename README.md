# Running the script

Just run the following script to gerenrate the images:

```bash
docker run -it -v "$PWD"/letsencrypt/archive/:/etc/letsencrypt/archive -v "$PWD"/letsencrypt/logs/:/var/log/letsencrypt 2ndkauboy/letsencrypt letsencrypt-auto certonly --manual --agree-tos --manual-public-ip-logging-ok --email admin@example.com -d example.com -d www.example.com
```