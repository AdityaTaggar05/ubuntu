General programs
- [nvim](https://github.com/AdityaTaggar05/nvim.git)
- tmux
- zsh
- ghostty
- lazygit
- rclone (for drive sync)

GNOME Extensions
- Clipboard Indicator
- Dash2Dock Animated
- X11 Gestures

> NOTE:
> Put the obsidian watch service under $HOME/.config/systemd/user directory
> Put the battery limit services under /etc/systemd/system directory and enable the services

To adjust the scroll speed
```bash
sudo xinput list                  # find the id of touchpad
xinput set-prop <id> "libinput Scrolling Pixel Distance" 40
```
