# Starting off with the Jenkins base Image
FROM jenkins/jenkins:lts

# Installing the plugins we need using the in-built install-plugins.sh script
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# Skip the initial setup wizard & setting Jenkins params
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV JAVA_OPTS -Dhudson.Functions.autoRefreshSeconds=30

# Start-up scripts to set number of executors and creating the admin user
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/

# Copy ssh files to container
COPY .ssh/ /var/jenkins_home/.ssh/

USER root
RUN chmod +x /var/jenkins_home/.ssh/chmod.sh && /var/jenkins_home/.ssh/chmod.sh

USER jenkins

VOLUME /var/jenkins_home