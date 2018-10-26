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
command -v dconf &> /dev/null
if [ "$?" -ne 0 ]; then
    >&2 echo "dconf not installed, cannot load settings..." 
fi

# ┏┳┓┏━╸╺┳┓╻┏━┓   ╻┏ ┏━╸╻ ╻┏━┓
# ┃┃┃┣╸  ┃┃┃┣━┫   ┣┻┓┣╸ ┗┳┛┗━┓
# ╹ ╹┗━╸╺┻┛╹╹ ╹   ╹ ╹┗━╸ ╹ ┗━┛
dconf load /org/gnome/settings-daemon/plugins/media-keys/ <<EOF
[/]
previous='<Primary><Alt>b'
next='<Primary><Alt>f'
play='<Primary><Alt>p'
EOF

# ╺┳╸┏━┓┏━╸┏━╸╻  ┏━╸   ╻ ╻╻┏┓╻╺┳┓┏━┓╻ ╻   ┏┳┓┏━┓╻ ╻╻┏┳┓┏━┓╺┳╸╻┏━┓┏┓╻
#  ┃ ┃ ┃┃╺┓┃╺┓┃  ┣╸    ┃╻┃┃┃┗┫ ┃┃┃ ┃┃╻┃   ┃┃┃┣━┫┏╋┛┃┃┃┃┣━┫ ┃ ┃┃ ┃┃┗┫
#  ╹ ┗━┛┗━┛┗━┛┗━╸┗━╸   ┗┻┛╹╹ ╹╺┻┛┗━┛┗┻┛   ╹ ╹╹ ╹╹ ╹╹╹ ╹╹ ╹ ╹ ╹┗━┛╹ ╹
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
