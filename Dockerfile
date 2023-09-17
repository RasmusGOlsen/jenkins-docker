FROM jenkins/jenkins:2.414.1

# install rsync
USER root
RUN apt-get update -y && apt-get install -y \
    rsync \
    python3 \
    python3-pip \
    python-is-python3

RUN pip install --break-system-packages \
    robotframework \
    robotframework-pabot \
    robotframework-lint \
    tox \
    flake8

# install plugins
COPY plugins/plugins.txt /usr/share/jenkins/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/plugins.txt

# copy seedjob
# COPY job.d/<jobname>.xml /usr/share/jenkins/ref/jobs/<jobname>/config.xml

# Jenkins-as-code configuration files
ADD config.d /usr/share/jenkins/config.d
ENV CASC_JENKINS_CONFIG /usr/share/jenkins/config.d
