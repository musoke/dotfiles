#!/bin/env bash

# Script to rank Arch Linux mirrors with reflector

cp --backup --suffix ~$(date +%Y-%m-%d-%H-%M-%S) /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
reflector --verbose --latest 10 --sort rate --save /etc/pacman.d/mirrorlist
