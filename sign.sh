#!/bin/sh
rm docs/index.html.gpg
gpg -s --default-key D44D3077F7AED1E0B7D7F7AED6301856767EE50E docs/index.html
