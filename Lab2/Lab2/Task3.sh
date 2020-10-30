#!/bin/bash

ps -ef |sort -nk9 |tail -n 5|head -n 1| awk '{print $2": " $9}'
