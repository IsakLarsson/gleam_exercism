#!/usr/bin/env bash

echo "Which exercise would you like to download?"
read exercise
exercism download --track=gleam --exercise="$exercise"
cd "$exercise" || exit
