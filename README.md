# Basic Installation of ArchLinux with UTM on MacOS

### Installing Arch with archinstall

```bash
sudo pacman -Syyu
sudo pacman -Syy archinstall
archinstall
```

### After installing arch 

Install general packages that are required for i3wm and better display
```bash
sudo pacman -S spice-vdagent xf86-video-qxl git openssh xorg-server xorg-apps xorg-xinit xclip xdotool i3 noto-fonts noto-fonts-emoji ttf-firacode-nerd rxvt-unicode alacritty kitty dmenu rofi firefox

sudo systemctl enable sshd
sudo systemctl enable dhcpcd

sudo reboot
```
Once the machine is started login to terminal and execute command

```startx```

Place following code in file /etc/X11/xorg.conf.d/10-monitor.conf
```
Section "Monitor"
    Identifier "Virtual-1"
    Modeline "2560x1600"  348.50  2560 2760 3032 3504  1600 1603 1609 1658 -hsync +vsync
    Option "PreferredMode" "2560x1600"
EndSection

Section "Screen"
    Identifier "Screen0"
    Monitor "Virtual-1"
    DefaultDepth 24
    SubSection "Display"
        Modes "2560x1600"
    EndSubSection
EndSection
```



Place following code in file /etc/X11/xorg.conf.d/40-libinput.conf

```conf
Section "InputClass"
        Identifier "libinput pointer catchall"
        MatchIsPointer "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "NaturalScrolling" "True"
EndSection

Section "InputClass"
        Identifier "libinput keyboard catchall"
        MatchIsKeyboard "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
EndSection

Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
EndSection

Section "InputClass"
        Identifier "libinput touchscreen catchall"
        MatchIsTouchscreen "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
EndSection

Section "InputClass"
        Identifier "libinput tablet catchall"
        MatchIsTablet "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
EndSection
```

Place following file in ~/.Xresources
```
! 
! ██╗  ██╗██████╗ ███████╗███████╗ ██████╗ ██╗   ██╗██████╗  ██████╗███████╗███████╗
! ╚██╗██╔╝██╔══██╗██╔════╝██╔════╝██╔═══██╗██║   ██║██╔══██╗██╔════╝██╔════╝██╔════╝
!  ╚███╔╝ ██████╔╝█████╗  ███████╗██║   ██║██║   ██║██████╔╝██║     █████╗  ███████╗
!  ██╔██╗ ██╔══██╗██╔══╝  ╚════██║██║   ██║██║   ██║██╔══██╗██║     ██╔══╝  ╚════██║
! ██╔╝ ██╗██║  ██║███████╗███████║╚██████╔╝╚██████╔╝██║  ██║╚██████╗███████╗███████║
! ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚══════╝╚══════╝
!
! Xresources Config File by Arfan Zubi


!! Appearance
URxvt.font: \
    xft:FiraCode Nerd Font Mono:size=7:antialias=true:hinting=true,\
    xft:Noto Color Emoji:size=7
URxvt.letterSpace: -1
URxvt.lineSpace: 0
URxvt.geometry: 92x24
URxvt.internalBorder: 10
URxvt.cursorBlink: true
URxvt.cursorUnderline: false
URxvt.saveline: 2048
URxvt.scrollBar: false
URxvt.scrollBar_rigth: false
URxvt.urgentOnBell: true
URxvt.depth: 32
URxvt.iso14755: false

!! Colorscheme
*.foreground: #D3C6AA
*.background: #2F383E
*.cursorColor: #FFFFFF

! black
*.color0: #7A8478
*.color8: #859289
! red
*.color1: #E67E80
*.color9: #E67E80
! green
*.color2: #A7C080
*.color10: #A7C080
! yellow
*.color3: #DBBC7F
*.color11: #DBBC7F
! blue
*.color4: #7FBBB3
*.color12: #7FBBB3
! magenta/purple
*.color5: #D699B6
*.color13: #D699B6
! cyan
*.color6: #83C092
*.color14: #83C092
! white
*.color7: #D3C6AA
*.color15: #D3C6AA

!! Extensions
URxvt.perl-ext-common: default,resize-font

! Extension Settings
URxvt.keysym.C-Down:  resize-font:smaller
URxvt.keysym.C-Up:    resize-font:bigger

URxvt.urlLauncher: firefox
URxvt.underlineURLs: true
URxvt.urlButton: 1

!! Retina Display Settings
Xft.dpi: 235

Xft.autohint: 0
Xft.lcdfilter: lcddefault
Xft.hintstyle: hintfull
Xft.hinting: 1
Xft.antialias: 1
Xft.rgba: rgb
```

Place following file in ~/.xinitrc

```
#!/bin/sh
#
# ██╗  ██╗██╗███╗   ██╗██╗████████╗██████╗  ██████╗
# ╚██╗██╔╝██║████╗  ██║██║╚══██╔══╝██╔══██╗██╔════╝
#  ╚███╔╝ ██║██╔██╗ ██║██║   ██║   ██████╔╝██║
#  ██╔██╗ ██║██║╚██╗██║██║   ██║   ██╔══██╗██║
# ██╔╝ ██╗██║██║ ╚████║██║   ██║   ██║  ██║╚██████╗
# ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝
#

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

intern=eDP1
extern=HDMI2

# Merge in Defaults and Keymaps

if [ -f $sysresources ]; then
	xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
	xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
	xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
	xmodmap "$usermodmap"
fi

# Toggle external monitor
if xrandr | grep "$extern disconnected"; then
	xrandr --output "$extern" --off --output "$intern" --auto
else
	xrandr --output "$intern" --primary --auto --output "$extern" --above "$intern" --auto
fi


# Start i3 Window Manager when starting X Server
exec i3
```


sudo shutdown

Once your machine is shutdown, in UTM, in settings for the machine, change:

Display: Upscaling: Nearest Neighbour
![Prev](Screenshot1.png)

to

Display: Upscaling: Linear

and enable Retina Mode

![New](Screenshot2.png)


Change default login terminal to alacritty

Modify /usr/bin/i3-sensible-terminal, and change the order of the terminals. 
Ex: by default the file is something like:

for terminal in "$TERMINAL" x-terminal-emulator urxvt (etc etc) alacritty (etc etc)

You could modify it so that alacritty appears in the list before urxvt, and is therefore loaded first:

for terminal in "$TERMINAL" alacritty x-terminal-emulator urxvt (etc etc)


