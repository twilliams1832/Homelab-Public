#!/bin/sh

# Install dependencies (Git and Go)
apk update
apk add git go

# Set up Go environment variables
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Clone the mkcert repository
git clone https://github.com/FiloSottile/mkcert.git

# Change to the mkcert directory
cd mkcert

# Build mkcert
go build

# Install mkcert globally
mv mkcert /usr/local/bin/mkcert

# Display mkcert version
mkcert -version
