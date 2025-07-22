#!/bin/bash
set -eux

# Install base deps
apt update
apt install -y build-essential curl libffi-dev libncurses-dev git

# Install Racket
curl -O https://download.racket-lang.org/installers/8.12/racket-8.12-x86_64-linux.sh
chmod +x racket-8.12-x86_64-linux.sh
./racket-8.12-x86_64-linux.sh --in-place --dest /usr/local/racket
echo 'export PATH=/usr/local/racket/bin:$PATH' >> /etc/profile.d/racket.sh
export PATH=/usr/local/racket/bin:$PATH

# Add raco to PATH immediately (for current session)
export PATH="/usr/local/racket/bin:$PATH"

# Install Pie via raco
raco pkg install --auto pie
