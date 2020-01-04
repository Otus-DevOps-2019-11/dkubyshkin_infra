#!/bin/bash
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
tee /lib/systemd/system/reddit-app.service << EOF
[Unit]
Description=Reddit_Service

[Service]
WorkingDirectory=/home/appuser/reddit
ExecStart=/usr/local/bin/puma
Restart=always
RestartSec=10
SyslogIdentifier=reddit-app

[Install]
WantedBy=multi-user.target
EOF
systemctl enable reddit-app
systemctl start reddit-app