.PHONY: build up ssh stop destroy nvm virtualenv

# docker dev ================================================================

build: 
	docker-compose build

up:
	docker-compose up -d

ssh:
	docker-compose exec app bash

docker: build up ssh

stop:
	docker-compose down

destroy:
	docker-compose down -v

# local dev ================================================================

vitualenv:
	python3 -m venv venv && \
	source venv/bin/activate && \
	pip install -r requirements.txt && \
	cp cms/settings/local.example.py cms/settings/local.py

local: vitualenv
	source venv/bin/activate && python manage.py migrate && python manage.py runserver 0:8000

superuser:
	source venv/bin/activate && echo "from django.contrib.auth import get_user_model; get_user_model().objects.create_superuser('admin', '', 'password'); quit();" | python manage.py shell

# frontend ================================================================

start:
	. ${NVM_DIR}/nvm.sh && nvm use && npm install && npm run gulp
