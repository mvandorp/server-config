#!/bin/bash

SERVER_PATH="$HOME/Steam/steamapps/common/Left 4 Dead 2 Dedicated Server/srcds_run"

DEAD_CENTER=c1m1_hotel
DARK_CARNIVAL=c2m1_highway
SWAMP_FEVER=c3m1_plankcountry
HARD_RAIN=c4m1_milltown
PARISH=c5m1_waterfront
NO_MERCY=c8m1_apartment

DEFAULT_MAP=$PARISH

screen -mdS server01 taskset -c 0 "$SERVER_PATH" -game left4dead2 -tickrate 100 -port 27015 +map $DEFAULT_MAP +mp_gamemode "versus" +exec server_id_01
screen -mdS server02 taskset -c 1 "$SERVER_PATH" -game left4dead2 -tickrate 100 -port 27016 +map $DEFAULT_MAP +mp_gamemode "versus" +exec server_id_02
screen -mdS server03 taskset -c 2 "$SERVER_PATH" -game left4dead2 -tickrate 100 -port 27017 +map $DEFAULT_MAP +mp_gamemode "versus" +exec server_id_03
screen -mdS server04 taskset -c 3 "$SERVER_PATH" -game left4dead2 -tickrate 100 -port 27018 +map $DEFAULT_MAP +mp_gamemode "versus" +exec server_id_04
screen -mdS server05 taskset -c 4 "$SERVER_PATH" -game left4dead2 -tickrate 100 -port 27019 +map $DEFAULT_MAP +mp_gamemode "versus" +exec server_id_05
screen -mdS server06 taskset -c 5 "$SERVER_PATH" -game left4dead2 -tickrate 100 -port 27020 +map $DEFAULT_MAP +mp_gamemode "versus" +exec server_id_06
