"""
This script prompts the user for a list of domains, separated by commas.
It then generates SSL certificates for each domain using the `mkcert` binary.
The generated certificates are copied to the `/certs` directory.

Ensure that the `mkcert` command-line tool is installed and available in the system's PATH.

Usage:
1. Run the script: `python generate_certs.py`
2. Enter the list of domains when prompted, separated by commas.
3. The script will generate the certificates and copy them to the `/certs` directory.
"""

import subprocess
import shutil

# Prompt the user for domains
domains_input = input("Enter domains (separated by commas): ")

# Split the input into individual domain names
domains = [domain.strip() for domain in domains_input.split(",")]

# Run mkcert command for each domain
for domain in domains:
    subprocess.run(["mkcert", "-cert-file", f"{domain}.pem", "-key-file", f"{domain}-key.pem", domain])

# Copy the generated .pem files to the /certs directory
for domain in domains:
    shutil.move(f"{domain}.pem", "/certs")
    shutil.move(f"{domain}-key.pem", "/certs")

print("Certificates generated and copied to /certs directory.")
