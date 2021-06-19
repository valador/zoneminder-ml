## Init database

```bash
docker-compose run --rm zm sh -c 'mysql -h ${ZM_DB_HOST} -u ${ZM_DB_USER} -p${ZM_DB_PASS} < /usr/share/zoneminder/db/zm_create.sql'
```

mlbase тэги
```
cpu cuda10.2-cudnn7 cuda10.2-cudnn8 cuda11.0-cudnn8 cuda11.1-cudnn8
```

```bash
docker push slayerus/mlbase:cpu 
```