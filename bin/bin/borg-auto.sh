#!/bin/sh
# REPOSITORY=/media/nathan/VERBATIM\ HD/borg-repo
# REPOSITORY=/media/nathan/Elements/borg-repo
REPOSITORY=/media/nathan/Elements\ SE/borg-repo

echo "Using repository: \"$REPOSITORY\""

# Backup /home except some directories
borg create -v --stats --progress                       \
    --compression zlib,6                                \
    "$REPOSITORY"::'{hostname}-{now:%Y-%m-%d-%H-%M-%S}' \
    /home                                               \
    --exclude-caches                                    \
    --exclude '/home/*/.ssh'                            \
    --exclude '/home/*/.gnupg/random_seed'              \
    --exclude '/home/*/.gnupg/.#*'                      \
    --exclude '/home/*/.gnupg/.lock'                    \
    --exclude '/home/*/.mutt/temp'                      \
    --exclude '/home/*/.mpd/pid'                        \
    --exclude '/home/*/.mpd/database'                   \
    --exclude '/home/*/.mpd/log'                        \
    --exclude '/home/*/.mpd/state'                      \
    --exclude '/home/*/.mozilla/firefox/*/Cache'        \
    --exclude '/home/*/.config/chromium'                \
    --exclude '/home/*/.cache'                          \
    --exclude '/home/*/tmp'                             \
    --exclude '/home/*/.dropbox'                        \
    --exclude '/home/*/.dropbox-dist'                   \
    --exclude '/home/*/.conda'                          \
    --exclude '/home/*/.cargo'                          \
    --exclude '/home/*/target/debug'                    \
    --exclude '/home/*/target/rls'                      \
    --exclude '/home/*/.julia/artifacts'                \
    --exclude '/home/*/.julia/compiled'                 \
    --exclude '/home/*/.julia/packages'                 \
    --exclude '/home/*/.rustup'                         \
    --exclude '/home/*/go'                              \
    --exclude '/home/*/.theano'                         \
    --exclude '/home/*/.gem'                            \
    --exclude '/home/*/.dbus'                           \
    --exclude '/home/*/.recently-used'                  \
    --exclude '/home/*/.recently-used.xbel'             \
    --exclude '/home/*/.thumbnails'                     \
    --exclude '/home/*/.Xauthority'                     \
    --exclude '/home/*/.local/lib/python*'              \
    --exclude '/home/*/.local/share/Trash'              \
    --exclude '/home/*/.local/share/flatpak'            \
    --exclude '/home/*/.local/share/marble'             \
    --exclude '/home/*/.AndroidStudio*'                 \
    --exclude '/home/*/.Android*'                       \
    --exclude '/home/*/anaconda*'                       \
    --exclude '/home/*/snap'                            \
    --exclude '/home/*/media/videos/movies'


# Prune archives from this machine.
borg prune -v --stats --list                            \
    "$REPOSITORY" --prefix '{hostname}-'                \
    --keep-within=2d                                    \
    --keep-daily=7                                      \
    --keep-weekly=8                                     \
    --keep-monthly=12                                   \
    --keep-yearly=80
