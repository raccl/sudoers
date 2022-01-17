#!/bin/sh
ch_mod(){
 # Set permissions 0440 to /etc/sudoers.d/*
 chmod 0440 /etc/sudoers.d/*
}
ch_mod
