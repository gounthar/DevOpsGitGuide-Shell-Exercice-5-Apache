# This Dockerfile is used to create a custom Gitpod workspace image.
# Gitpod is a service that provides ready-to-code development environments in the cloud.

# The base image is gitpod/workspace-python, which includes a full development environment.
FROM gitpod/workspace-python

# Switch to the root user to have the necessary permissions for the following operations.
USER root

# Update the package lists for upgrades and new package installations.
# Install cron, apache2, mariadb-client, tree, and telnet packages.
RUN apt-get update && apt-get install -y cron apache2 mariadb-client tree telnet

# Start the cron service.
# The service command is used to run a System V init script.
RUN service cron start
