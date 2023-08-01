cd
cp ./configs/10-monitor.conf /etc/X11/xorg.conf.d/10-monitor.conf
cp ./configs/40-libinput.conf /etc/X11/xorg.conf.d/40-libinput.conf
cp ./configs/.Xresources ~/.Xresources
cp ./configs/.xinitrc ~/.xinitc
echo "startx" >> ~/.bash_profile
sudo shutdown
