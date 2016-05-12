# Running the script

Just run the following script to gerenrate the certificates:

```bash
docker run -it -v "$PWD"/letsencrypt/archive/:/etc/letsencrypt/archive -v "$PWD"/letsencrypt/logs/:/var/log/letsencrypt 2ndkauboy/letsencrypt letsencrypt-auto certonly --manual --agree-tos --manual-public-ip-logging-ok --email admin@example.com -d example.com -d www.example.com
```

The challenge will pause and ask you to create a file with a random name in the `.well-known/acme-challenge/` of your web server. After doing so, resume the process by pressing ENTER.

You will than find the certificates in the subfolder `letsencrypt/archive/[DOMAIN]` of your current working folder.