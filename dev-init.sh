#!/bin/sh

################################################################################
# Script: dev-init.sh
# Description: Container Setup Script for Alpine Linux
#
# This script automates the setup process for a container running Alpine Linux.
# It performs the following tasks:
#   - Adds a new user with prompts for username and password.
#   - Adds the user to the sudo group and grants sudo access.
#   - Installs SSH, Python, Git, and iputils.
#
# Usage: ./setup.sh
#
################################################################################

# Add a user with prompts for username and password
add_user() {
    echo "Adding a new user..."
    read -p "Enter username: " username
    adduser -D "$username"
    passwd "$username"
    echo "User added successfully!"
}

# Add the user to the sudo group and grant sudo access
add_user_to_sudo() {
    echo "Adding user to the sudo group and granting sudo access..."
    read -p "Enter username: " username
    adduser "$username" sudo
    echo "$username ALL=(ALL) ALL" >> /etc/sudoers
    echo "User added to the sudo group and granted sudo access!"
}

# Install SSH, Python, Git, and iputils
install_dependencies() {
    echo "Installing dependencies..."
    apk update
    apk add openssh python3 git iputils
    echo "Dependencies installed successfully!"
}

# Main script
add_user
add_user_to_sudo
install_dependencies
