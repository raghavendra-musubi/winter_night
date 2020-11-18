# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.8-slim-buster

EXPOSE 8000

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install pip requirements
ADD requirements.txt .
RUN pip3 install -r requirements.txt

# Install apache and mod_wsgi
RUN apt-get -qq update
RUN apt-get install --yes apache2 apache2-dev
# RUN apt-get install --yes apache2 
RUN pip3 install mod_wsgi

# copy code 
WORKDIR /app
ADD . /app

# set owner access 
RUN chown www-data -R /app/

# set permission
# RUN chown www-data /app/.logs/debug.log

CMD mod_wsgi-express start-server /app/winter_night/wsgi.py --user www-data --group www-data

# Switching to a non-root user, please refer to https://aka.ms/vscode-docker-python-user-rights
# RUN useradd appuser && chown -R appuser /app
# USER appuser

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
# CMD ["gunicorn", "--bind", "0.0.0.0:8000", "winter_night.wsgi"]
