<<<<<<< HEAD
# zoneminder-ml
=======
## Init database

```bash
docker-compose run --rm app sh -c 'mysql -h $ZM_DB_HOST -u $ZM_DB_USER -p$ZM_DB_PASS < /usr/share/zoneminder/db/zm_create.sql'
```
>>>>>>> Initial commit
