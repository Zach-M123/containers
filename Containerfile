# Specify container base images and add content
FROM registry.redhat.io/rhscl/httpd-24-rhel7

# Add and extract tarball file
ADD app.tar /devOps/

# Configure runtime environment(user, working directory, commands)
# user id
USER 1000

# Working Directory
WORKDIR /devOps/

# Executing Command
RUN sudo yum install python3 -y && sudo yum clean all


