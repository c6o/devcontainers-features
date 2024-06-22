#!/bin/bash
set -e

# Function to check if curl is installed
check_curl_installed() {
    if command -v curl > /dev/null 2>&1; then
        echo "curl is already installed."
        return 0
    else
        echo "curl is not installed."
        return 1
    fi
}

# Function to determine the package manager and install curl
install_curl() {
    if [[ -n $(command -v apt-get) ]]; then
        echo "Using apt-get to install curl."
        sudo apt-get update
        sudo apt-get install -y curl
    elif [[ -n $(command -v yum) ]]; then
        echo "Using yum to install curl."
        sudo yum install -y curl
    elif [[ -n $(command -v dnf) ]]; then
        echo "Using dnf to install curl."
        sudo dnf install -y curl
    elif [[ -n $(command -v pacman) ]]; then
        echo "Using pacman to install curl."
        sudo pacman -S --noconfirm curl
    elif [[ -n $(command -v zypper) ]]; then
        echo "Using zypper to install curl."
        sudo zypper install -y curl
    else
        echo "No known package manager found. Please install curl manually."
        exit 1
    fi
}

# Main script logic
if ! check_curl_installed; then
    install_curl
fi

# Install codezero headless tooling
curl -L https://releases.codezero.io/install-headless.sh | /bin/bash