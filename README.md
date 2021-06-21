## Init database

```bash
docker-compose run --rm zm sh -c 'mysql -h ${ZM_DB_HOST} -u ${ZM_DB_USER} -p${ZM_DB_PASS} < /usr/share/zoneminder/db/zm_create.sql'
docker-compose run --rm zm sh -c 'mysql -h db -u zmuser -D zm -p zm < /usr/share/zoneminder/db/zm_create.sql'
```

mlbase тэги
```
cpu cuda10.2-cudnn7 cuda10.2-cudnn8 cuda11.0-cudnn8 cuda11.1-cudnn8
```

```bash
docker build -t slayerus/mlbase:cpu --build-arg python_version=3.8 --build-arg opencv_version=4.5.2 --build-arg dlib_version=v19.22 ./mlbase/dist/cpu/.
docker push slayerus/mlbase:cpu

docker build -t slayerus/zoneminder:1.36 --build-arg version=1.36 --build-arg ffmpeg_version=4.4-ubuntu1804 ./zoneminder/.
docker push slayerus/zoneminder:1.36
```

Переделать ENV для ${MLAPI_DIR}/secrets.ini, ато как то костыляво...

Local vs. Remote server for Machine Learning
As of version 5.0.0, you can now configure an API gateway for remote machine learning by installing my mlapi server on a remote server. Once setup, simply point your ml_gateway inside objectconfig.ini to the IP/port of your gateway and make sure ml_user and ml_password are the user/password you set up on the API gateway. That’s all.

The advantage of this is that you don’t need to install any ML libraries within zoneminder if you are running mlapi on a different server. Further, mlapi loads the model only once so it is much faster. In older versions this was kludgy because you still had to install ML libraries locally in ZM, but no longer. Infact, I’ve completely switched to mlapi now for my own use. Note that when you use remote detection, you will still need opencv in the host machine (opencv is used for other


We are using environment variables to automatically populate secrets.ini at runtime. There are a number of optional fields in there so here are the minimum recommended environment variables to get started with the Event Notification Server.

ZM_PORTAL: EventServer uses the external URL of your ZoneMinder instance when pushing notifications to devices. For example, https://<UUID>.balena-devices.com/zm/ if using the Public Device URL.
ZM_USER: EventServer uses your ZoneMinder username to authenticate with your ZoneMinder portal.
ZM_PASSWORD: EventServer uses your ZoneMinder password to authenticate with your ZoneMinder portal.
The full list of supported secrets can be found in zm/secrets.ini.