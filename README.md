## Init database

```bash
docker-compose run --rm zm sh -c 'mysql -h ${ZM_DB_HOST} -u ${ZM_DB_USER} -p${ZM_DB_PASS} < /usr/share/zoneminder/db/zm_create.sql'
```

mlbase тэги
```
cpu cuda10.2-cudnn7 cuda10.2-cudnn8 cuda11.0-cudnn8 cuda11.1-cudnn8
```

```bash
docker build -t slayerus/mlbase:cpu --build-arg python_version=3.8 --build-arg opencv_version=4.5.2 --build-arg dlib_version=v19.22 ./mlbase/dist/cpu/.
docker push slayerus/mlbase:cpu 

docker build -t slayerus/zoneminder:1.36.4 --build-arg version=1.36 --build-arg ffmpeg_version=4.4-ubuntu1804 ./zoneminder/.
docker push slayerus/zoneminder:1.36.4
```