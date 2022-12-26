COMPOSE_CMD="docker-compose"
RUN_CMD="docker-compose run --rm"
EXEC_CMD="docker-compose exec"

### DOCKER-COMPOSE ###

function dbuild {
    # docker-compose build
    sh -c "$COMPOSE_CMD build"
}

function dup {
    # docker-compose up -d
    sh -c "$COMPOSE_CMD up -d"
}

function ddown {
    # docker-compose down
    sh -c "$COMPOSE_CMD down"
}

function ddestroy {
    # docker-compose up -d
    sh -c "$COMPOSE_CMD down -v"
}

function dbash {
    # docker-compose run app bash
    sh -c "$RUN_CMD app bash"
}

function djmigrate {
    sh -c "$RUN_CMD app bash -c 'python manage.py migrate'"
}

function djcreatesuperuser {
    sh -c "$RUN_CMD app bash -c '/root/.superuser.sh'"
}

function djtest {
    sh -c "$RUN_CMD app bash -c 'python manage.py test'"
}

function djrun {
    sh -c "$EXEC_CMD app bash -c 'python manage.py runserver 0.0.0.0:8000'"
}

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