#!/bin/bash

pipenv run python "$1"/manage.py runserver 0.0.0.0:8000
