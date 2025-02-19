#!/bin/bash
set -e

sudo tee /etc/wsl.conf <<EOF
[boot]
systemd=true
EOF

echo '完成，请使用wsl --shutdown彻底关闭wsl，再重启wsl！'


