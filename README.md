# listeners
A notification or indicator that tells you when a submap (and which) is active in hyprland.
For now this presumes you are using "mako" notification manager. I am plannign on adding 
other notification managers in the future.

1) put the listeners folder in your hypr config file.

2) add the next line to your hyprland.conf file

exec-once = $HOME/.config/hypr/listeners/submap_listen.sh

3) restart hyprland

That is all for basic functionality. I you want to customize your mako notification. 


if you want to customize this notification, follow the directions below.
Unncomment the follwing lines in submap_listen.sh

\# makoctl mode -r hyprsubmaps

\# makoctl mode -a hyprsubmaps

mkdir -p ~/.config/mako/config

nano ~/.config/mako/config

and paste the following into the file

[mode=hyprsubmaps]
background-color=#000000
text-color=#FFFFFF
border-color=#4C7899FF
progress-color=over #5588AAFF
border-radius=4
padding=20
border-size=2
border-color=#FFFF00

*for more customization options, see the mako documentation at "mako -h" in the terminal
or https://man.archlinux.org/man/mako.5.en
