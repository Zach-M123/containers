# Specify container base images and add content
FROM registry.redhat.io/rhscl/httpd-24-rhel7

# Add and extract tarball file
ADD app.tar /devOps/

# Configure runtime environment(user, working directory, commands)
# user id
USER 1000

# Working Directory
WORKDIR /devOps/

# Work with container volumes and hosts data sharing
VOLUME /devOps/database/

# Executing Command
RUN sudo yum install python3 -y && sudo yum clean all

# Expose ports and pass environment variables/arguments
# Expose port
EXPOSE 8080

# Environment Variable
ENV HOSTNAME="Frontend"

# Argument
ARG VERSION="0.1"

# Specify commands for custom images
ENTRYPOINT ["python3"]

CMD ["app.py"]

