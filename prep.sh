#!/bin/bash

echo 'deb [trusted=yes] https://apt.fury.io/ascii-image-converter/ /' | sudo tee /etc/apt/sources.list.d/ascii-image-converter.list

sudo apt update
sudo apt install -y ascii-image-converter
