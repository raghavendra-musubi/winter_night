
# Django Learning Slides

- [Slides](django-concepts.pdf)

# Project Details

- this is a Blog App
  - Using Django 
  - following [Django Playlist by CoreyMS](https://www.youtube.com/playlist?list=PL-osiE80TeTtoQCKZ03TU5fNfx2UY6U4p)

# SMTP Resources

- [Ethereal](https://ethereal.email/)

# Apache Server

- [Vagrant Box with Apache](https://drive.google.com/file/d/1M735ua2HjVW2VWervuGQJ9vYvkv-gkG1/view?usp=sharing)
- [Docker with Apache](https://github.com/raghavendra-musubi/winter_night/tree/apache-build-attempt)
  - [Setup Apache with Docker File](https://karllorey.com/posts/django-production-docker-mod-wsgi/)

# Gunicorn Server

- [Docker with Gunicorn](https://github.com/raghavendra-musubi/winter_night/tree/docker-gunicorn)
  - [Setup Gunicorn with Docker](https://code.visualstudio.com/docs/containers/quickstart-python)


# Docker Setup 

### CLI

- Clone one of the above Docker repository, either for Apache or Gunicorn server
- Make sure these requirements are in the `requirements.txt` file
  - apache server 
    ```
    django==3.1.1
    django-crispy-forms==1.9.2
    Pillow==7.2.0
    ```
  - gunicorn server 
    ```
    django==3.1.1
    gunicorn==20.0.4
    django-crispy-forms==1.9.2
    Pillow==7.2.0
    ```
- Navigate to the project base directory in the CLI
- Use the Dockerfile to build the image
  ```zsh
  docker build --tag winter-night:v0 .
  ```
- Run the image to deploy to a contianer 
  ```zsh
  docker run --publish 8000:8000 --detach --name wn winter-night:v0
  ```
- Check the application running in the browser 
  - go to `localhost:8000`

### GUI

- Clone one of the above Docker repository, either for Apache or Gunicorn server
- Make sure these requirements are in the `requirements.txt` file
  - apache server 
    ```
    django==3.1.1
    django-crispy-forms==1.9.2
    Pillow==7.2.0
    ```
  - gunicorn server 
    ```
    django==3.1.1
    gunicorn==20.0.4
    django-crispy-forms==1.9.2
    Pillow==7.2.0
    ```
 - in VSCode, right click on the Dockerfile and create image
 - in Docker Desktop, run the image to deploy a container 
    - name the container as `wn`
    - set port mapping to `8000`
    
- Check the application running in the browser 
  - go to `localhost:8000`
  
# Resources

- [https://itsyndicate.org/blog/relay-access-denied-solution/](https://itsyndicate.org/blog/relay-access-denied-solution/)
- [Docker - Build and Run your image](https://docs.docker.com/get-started/part2/)
