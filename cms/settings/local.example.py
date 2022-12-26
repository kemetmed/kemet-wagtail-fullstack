# local dev only settings

from cms.settings.dev import ALLOWED_HOSTS


CSRF_TRUSTED_ORIGINS = ["http://localhost:8000", "http://localhost:3000"]
