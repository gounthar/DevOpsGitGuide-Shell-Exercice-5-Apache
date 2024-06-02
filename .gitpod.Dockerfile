# This Dockerfile is used to create a custom Gitpod workspace image.
# Gitpod is a service that provides ready-to-code development environments in the cloud.

# The base image is gitpod/workspace-python, which includes a full development environment.
FROM gitpod/workspace-python

# Switch to the root user to have the necessary permissions for the following operations.
USER root

# Update the package lists for upgrades and new package installations.
# Install cron, apache2, tree, and telnet packages.
RUN apt-get update && apt-get install -y cron apache2 tree telnet

# Start the cron service.
# The service command is used to run a System V init script.
RUN service cron start

# Install ngrok
# ngrok is a cross-platform application that enables developers to expose a local development server to the Internet with minimal effort.
# The application captures all traffic for detailed inspection and replay.
# The curl command is used to download the ngrok.asc file from the ngrok-agent.s3.amazonaws.com server.
# The tee command is used to write the output of the curl command to the /etc/apt/trusted.gpg.d/ngrok.asc file.
# The echo command is used to add the ngrok-agent.s3.amazonaws.com server to the list of apt sources.
# The apt update command is used to download package information from all configured sources.
# The apt install command is used to install the ngrok package.
RUN curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
	| sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
	&& echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
	| sudo tee /etc/apt/sources.list.d/ngrok.list \
	&& sudo apt update \
	&& sudo apt install ngrok
