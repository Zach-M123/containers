# Specify container base images and add content
FROM docker.io/library/fedora

# Add and extract tarball file
ADD app.tar /devOps/

# Configure runtime environment(user, working directory, commands)

# Working Directory
WORKDIR /devOps/

# Work with container volumes and hosts data sharing
VOLUME /devOps/database/

# Executing Command
RUN dnf install python3 -y && dnf clean all

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

