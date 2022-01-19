#!/bin/sh
ch_mod(){
 # Set permissions 0440 to /etc/sudoers.d/*
 sudo chmod 0440 /etc/sudoers.d/*
}
ch_mod
