#!/bin/bash


if ! test -f /tmp/raylib-source-cache.h; then
	curl https://raw.githubusercontent.com/raysan5/raylib/refs/heads/master/src/raylib.h > /tmp/raylib-source-cache.h
fi

grep -inC 1  --color "$@" /tmp/raylib-source-cache.h
