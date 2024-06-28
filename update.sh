#!/bin/bash

# 闲鱼ID搜索：胡子哥爱游戏 再点击用户 即可找到产品
chmod +x /home/ps2/update

cat << EOF | sudo tee /etc/systemd/system/updatehuzige.service
[Unit]
Description=Update huzige Service
After=network.target

[Service]
ExecStart=/home/ps2/update
Type=simple
Restart=on-failure
RestartSec=5s

[Install]
WantedBy=multi-user.target
EOF

#终极版客户更新PS1 PS2封面金手指，修复等 有问题欢迎咨询 B站号：胡子哥爱游戏
sudo systemctl daemon-reload

sudo systemctl enable updatehuzige.service

/bin/rm -- "$0"

sudo reboot
