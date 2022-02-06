#!/bin/zsh

# First we install django
echo $(pipenv install django)
# Check if django is installed, print in screen
echo '/n'
pipenv run python -m django --version

# Now we create the django project based
# on the name provided by the user
pipenv run django-admin startproject "$1"

# Now we run the server on the background
./init.sh "$1" & 

