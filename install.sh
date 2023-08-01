cd
sudo pacman -S spice-vdagent xf86-video-qxl git openssh xorg-server xorg-apps xorg-xinit xclip xdotool i3 noto-fonts noto-fonts-emoji ttf-firacode-nerd rxvt-unicode alacritty kitty dmenu rofi firefox

sudo systemctl enable sshd
sudo systemctl enable dhcpcd

cp ./configs/10-monitor.conf /etc/X11/xorg.conf.d/10-monitor.conf
cp ./configs/40-libinput.conf /etc/X11/xorg.conf.d/40-libinput.conf
cp ./configs/.Xresources ~/.Xresources
cp ./configs/.xinitrc ~/.xinitc
echo "startx" >> ~/.bash_profile
sudo reboot