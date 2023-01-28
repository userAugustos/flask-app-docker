# See: https://docs.docker.com/engine/reference/builder/

FROM python:3.10.9-bullseye

# WORKDIR <folder>

WORKDIR /app
#  So since we put the working directory as /app, we are now working inside of /app

# COPY <file> <destiny>

COPY requirements.txt .
# so the copy will get the requirements.txt and copy inside of /app (. now is /app, since we are inside of /app)

# RUN <command/sequence of commands>

RUN pip install -r requirements.txt

# so here we get the requirements of your app, save to a file, copy this file inside your workdir and ask to pip to install it

# EXPOSE <port>

EXPOSE 5000
# so here, the  port that is exposed, will be the port that receive data, work data, and for us, the entry point of the application

# ENV <env_var> <value>

ENV FLASK_ENV development
# so we can set environment variables and they values

COPY app.py .
# copy the application and put into workdir

# So now we have the CMD, wich allows us to set what commands will run when the container start, CMD accepts and array of values:

CMD [ "flask", "run", "--host", "0.0.0.0" ]

# se that we pass the --host, since it will run from a container, your localhost as used, will not work