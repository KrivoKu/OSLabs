#!/bin/bash

ps -eo pid,command | tail -n +2| grep -E "/sbin/">ans2.txt
