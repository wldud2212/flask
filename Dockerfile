FROM ubuntu:latest

# Set environmant variables
ENV HOME_DIR="/opt/docker-sample"
ENV FLASK_APP="app.py"

# Install base packages
RUN apt-get update && apt-get install -y apt-utils python-pip git

# Install flask
RUN pip install flask pyyaml
COPY ./source ${HOME_DIR}

# Settiong flask
ADD flask.conf ${HOME_DIR}/flask.conf

WORKDIR ${HOME_DIR}

# Expose & Run flask server
EXPOSE 5000
ENTRYPOINT ["/user/local/bin/flask","run"]
CMD ["-h","0.0.0.0"]
