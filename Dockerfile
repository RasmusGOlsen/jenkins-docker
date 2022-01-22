FROM jenkins/jenkins:lts

# install rsync
USER root
RUN apt-get update -y && apt-get install -y rsync


# USER jenkins

# install plugins
COPY plugins/plugins.txt /usr/share/jenkins/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/plugins.txt

# copy seedjob
# COPY job.d/<jobname>.xml /usr/share/jenkins/ref/jobs/<jobname>/config.xml

# Jenkins-as-code configuration files
ADD config.d /usr/share/jenkins/config.d
ENV CASC_JENKINS_CONFIG /usr/share/jenkins/config.d
