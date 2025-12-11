killall mpvpaper
# mpvpaper ALL ~/.steam/steam/steamapps/workshop/content/431960/3103541488/无边框2K.mp4 -o "--mute --loop" -f
#
#
THEME="~/Wallpapers/videos/1820851138-西行寺幽々子 saigyōji yuyuko - 東方project.mp4"
# THEME="~/Wallpapers/videos/1403625644-Dune (1).mp4"
# THEME="~/Wallpapers/videos/2394949914-finalsound.mp4"
# THEME="~/Wallpapers/videos/3103541488-无边框2K.mp4"

# Pixelated
# THEME="~/Wallpapers/videos/2544905501-Normal.mp4"
# THEME="~/Wallpapers/videos/2492322379-IzashianWP.mp4"
# THEME="~/Wallpapers/videos/2473589076-Emily.mp4"
# THEME="~/Wallpapers/videos/2459477453-HomuraWP2.mp4"
# THEME="~/Wallpapers/videos/2701833190-RaidenWallpaper.mp4"
# THEME="~/Wallpapers/videos/2762331393-Cyberpunk.mp4"
#

mpvpaper ALL "$THEME" -o "--mute --loop --vf=scale=2560:1440:force_original_aspect_ratio=decrease,pad=2560:1440:-1:-1:black" -f
