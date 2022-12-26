#!/usr/bin/env bash

echo "from django.contrib.auth import get_user_model; get_user_model().objects.create_superuser('admin', '', 'password'); quit();" | python manage.py shell