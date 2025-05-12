#!/bin/bash
/usr/bin/systemd-run --user --unit=power_sound /home/mosh/.local/bin/play-sound "$1"
