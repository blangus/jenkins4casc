FROM jenkins/jenkins:lts

ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false"
ARG job_home="/usr/share/jenkins/ref/" 

# Install plugins from plugins.txt file
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# Create job folders and move job config to right folder
USER jenkins

# Define job names
ARG job_name_1="test"

# Create the jobs folder recursively  
RUN mkdir -p ${job_home}/jobs/${job_name_1}  
# Add the custom configs to the container  
COPY /configs/${job_name_1}_config.xml ${job_home}/jobs/${job_name_1}/config.xml 


