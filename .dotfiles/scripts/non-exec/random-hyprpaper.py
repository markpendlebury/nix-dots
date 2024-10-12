import os
import subprocess
import random
import time


from utilities import get_resolution

repo_url = "https://github.com/markpendlebury/ultrawide-wallpapers"
# resolution = os.popen("hyprctl monitors -j"
resolution = get_resolution()
config_file = f"{os.path.expanduser('~')}/.config/hypr/hyprpaper.conf"
all_monitors = os.popen("hyprctl monitors -j | jq -r '.[].name'").read()
all_wallpapers = os.popen(f"ls {os.path.expanduser('~')}/Documents/repos/Elements-Hyprland-V1/Wallpapers").read().split("\n")
all_wallpapers = [wallpaper for wallpaper in all_wallpapers if wallpaper]

monitor_wallpapers = []

# for each monitor, pick a random wallpapers: 
for monitor in all_monitors.split("\n"):
    if monitor:
        rnd = random.randint(0, len(all_wallpapers) -1)
        wallpaper = all_wallpapers[rnd]
        monitor_wallpapers.append(f"wallpaper = {monitor},~/Documents/repos/Elements-Hyprland-V1/Wallpapers/{wallpaper}")


# Write the config file: 
with open(config_file, "w") as f:
    f.write("splash = false\n\n")
    for wallpaper in all_wallpapers:
        f.write(f"preload = {os.path.expanduser('~')}/Documents/repos/Elements-Hyprland-V1/Wallpapers/{wallpaper}\n")

    for monitor_wallpaper in monitor_wallpapers:
        f.write(monitor_wallpaper + "\n")

os.system(f"pkill hyprpaper")
time.sleep(0.3)
process.Popen(["hyprpaper"])

hyprpaper.wait()
