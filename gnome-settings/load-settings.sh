#!/bin/bash
#
# To find settings:
# 1. Get ALL settings with `dconf dump / | less`
# 2. Find [org/suitable/setting] that you want to save
# 3. Copy output from `dconf dump /org/suitable/setting/`
# 4. Edit ^^^ if needed
# 5. Add ^^^ to this file with following syntax:
#    dconf load /org/suitable/setting/<<EOF
#    [/]
#    key='value'
#    key2='value2'
#    EOF
# 6. ????
# 7. Profit!
#
# Note: ascii art created with `toilet -f future TEXT`
#
# TODO: use gsettings instead, see why here: https://wiki.gnome.org/Initiatives/GnomeGoals/GSettingsMigration

command -v dconf &> /dev/null
if [ "$?" -ne 0 ]; then
    >&2 echo "$0: dconf not installed, cannot load settings..."
    exit 1
fi

# ┏┳┓┏━╸╺┳┓╻┏━┓   ╻┏ ┏━╸╻ ╻┏━┓
# ┃┃┃┣╸  ┃┃┃┣━┫   ┣┻┓┣╸ ┗┳┛┗━┓
# ╹ ╹┗━╸╺┻┛╹╹ ╹   ╹ ╹┗━╸ ╹ ┗━┛
dconf load /org/gnome/settings-daemon/plugins/media-keys/ <<EOF
[/]
previous=['<Shift><Super>b']
next=['<Shift><Super>f']
play=['<Shift><Super>p']
EOF

# ╺┳╸┏━┓┏━╸┏━╸╻  ┏━╸   ╻ ╻╻┏┓╻╺┳┓┏━┓╻ ╻   ┏┳┓┏━┓╻ ╻╻┏┳┓┏━┓╺┳╸╻┏━┓┏┓╻
#  ┃ ┃ ┃┃╺┓┃╺┓┃  ┣╸    ┃╻┃┃┃┗┫ ┃┃┃ ┃┃╻┃   ┃┃┃┣━┫┏╋┛┃┃┃┃┣━┫ ┃ ┃┃ ┃┃┗┫
#  ╹ ┗━┛┗━┛┗━┛┗━╸┗━╸   ┗┻┛╹╹ ╹╺┻┛┗━┛┗┻┛   ╹ ╹╹ ╹╹ ╹╹╹ ╹╹ ╹ ╹ ╹┗━┛╹ ╹

# <Super>1 needs to be re-set in order to force override default behavior of <Super>1
dconf load /org/gnome/desktop/wm/keybindings/ <<EOF
[/]
toggle-maximized=['']
EOF

dconf load /org/gnome/shell/keybindings/ <<EOF
[/]
switch-to-application-1=@as []
switch-to-application-2=@as []
switch-to-application-3=@as []
switch-to-application-4=@as []
switch-to-application-5=@as []
switch-to-application-6=@as []
switch-to-application-7=@as []
switch-to-application-8=@as []
switch-to-application-9=@as []
EOF

# Finally found a method for disabling the Super-<num> keybinding: https://askubuntu.com/questions/968103/disable-the-default-app-key-supernum-functionality-on-ubuntu-17-10-and-later

gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys false

dconf load /org/gnome/desktop/wm/keybindings/ <<EOF
[/]
toggle-maximized=['<Super>1']
toggle-fullscreen=['F11']
EOF

# ┏━╸╻  ┏━┓┏━╸╻┏     ┏━┓╻ ╻┏━┓╻ ╻   ╺┳┓┏━┓╺┳╸┏━╸ ╻ ┏━┓┏━╸┏━╸┏━┓┏┓╻╺┳┓┏━┓
# ┃  ┃  ┃ ┃┃  ┣┻┓╹   ┗━┓┣━┫┃ ┃┃╻┃    ┃┃┣━┫ ┃ ┣╸ ╺╋╸┗━┓┣╸ ┃  ┃ ┃┃┗┫ ┃┃┗━┓
# ┗━╸┗━╸┗━┛┗━╸╹ ╹╹   ┗━┛╹ ╹┗━┛┗┻┛   ╺┻┛╹ ╹ ╹ ┗━╸ ╹ ┗━┛┗━╸┗━╸┗━┛╹ ╹╺┻┛┗━┛
dconf load /org/gnome/desktop/interface/ <<EOF
[/]
clock-show-date=true
gtk-im-module='gtk-im-context-simple'
clock-show-seconds=true
EOF

# ╻┏┓╻┏━┓╻ ╻╺┳╸    ┏━╸┏┳┓┏━┓┏━╸┏━┓   ╻┏ ┏━╸╻ ╻┏┓ ╻┏┓╻╺┳┓╻┏┓╻┏━╸┏━┓
# ┃┃┗┫┣━┛┃ ┃ ┃ ╹   ┣╸ ┃┃┃┣━┫┃  ┗━┓   ┣┻┓┣╸ ┗┳┛┣┻┓┃┃┗┫ ┃┃┃┃┗┫┃╺┓┗━┓
# ╹╹ ╹╹  ┗━┛ ╹ ╹   ┗━╸╹ ╹╹ ╹┗━╸┗━┛   ╹ ╹┗━╸ ╹ ┗━┛╹╹ ╹╺┻┛╹╹ ╹┗━┛┗━┛
dconf load /org/gnome/desktop/interface/ <<EOF
[/]
gtk-im-module='gtk-im-context-simple'
gtk-key-theme='Emacs'
EOF

echo "Gnome settings loaded"
