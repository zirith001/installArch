sudo pacman -S spice-vdagent xf86-video-qxl git vim xorg-server xorg-apps xorg-xinit xclip xdotool i3 noto-fonts noto-fonts-emoji ttf-firacode-nerd rxvt-unicode alacritty kitty dmenu rofi firefox

CURRENT_DIR=$(pwd)
cp $CURRENT_DIR/configs/10-monitor.conf /etc/X11/xorg.conf.d/10-monitor.conf
cp $CURRENT_DIR/configs/40-libinput.conf /etc/X11/xorg.conf.d/40-libinput.conf
cp $CURRENT_DIR/configs/.Xresources ~/.Xresources
cp $CURRENT_DIR/configs/.xinitrc ~/.xinitc
echo "startx" >> ~/.bash_profile
sudo reboot