# Develop Full Stack Wagtail

Backend: [Wagtail CMS](https://wagtail.org/) Frontend: [Codyhouse Framework](https://codyhouse.co/)

## Start the app in Gitpod

Fork this repo. Then add `https://gitpod.io/#` to the begining of your own repo url. After a few minutes the site preview will open ready for you to begin customising the website. Or click the button below.

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/nickmoreton/gitpod-wagtail-codyhouse)

If you use the button above you will need to set the git remote to your own repo. The evironment will be setup using a Poetry virtual env.

The Gitpod environment will run a few commands automatically to set up the complete development environment. The commands it will run can be viewed in 
<a href=".gitpod.yml">.gitpod.yml</a>

---

## Start the app locally

You can develop the app locally using Poetry or Docker/Docker Compose.

- Install <a href="https://python-poetry.org">Poetry</a>
- Install <a href="https://docs.docker.com/get-docker/">Docker & docker-compose</a>

### First steps

There are some useful bash commands available in `/commands.sh` for developing with Poetry and Docker. In your terminal run

```bash
source commands.sh
```

There are a couple of env files required which you can generate by running the following command in your termminal:

```bash
linit
```
For your reference this is the `linit` command

```bash
### LOCAL VIRTUAL ENVIRONMENT ###
function linit {
    if [ ! -f app/settings/local.py ]
    then
        cp app/settings/local.example.py app/settings/local.py
        echo "CSRF_TRUSTED_ORIGINS = ['http://localhost:3000']" >> app/settings/local.py
    fi
    if [ ! -f .gitpod.env ]
    then
        echo "url=http://localhost:3000" >> .gitpod.env
    fi
}
```

### Poetry

```bash
poetry install
poetry run ./manage.py migrate
poetry run ./manage.py createsuperuser
poetry run ./manage.py runserver
```

Running locally will use sqlite3 database. You can view the site at: <http://localhost:8000>

The CMS admin will be available at <http://localhost:8000/admin> and login using the superuser account details you just created.

### Docker

```bash
dbuild
# docker-compose build

dup
# docker-compose up -d

ddown
# docker-compose down

ddestroy
# docker-compose down -d

dbash
# docker-compose run app bash

djmigrate
# runs python manage.py migrate in the app container

djcreatesuperuser
# runs /root/.superuser.sh in the app container

djtest
# runs python manage.py test in the container

djrun
# run (interactive) python manage.py runserver 0.0.0.0:8000 in the container

```

Running locally with docker will use postgres database. You can view the site at: <http://localhost:8000>

The CMS admin will be available at <http://localhost:8000/admin> and login using the superuser account details you just created.

