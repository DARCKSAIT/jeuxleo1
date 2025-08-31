#!/usr/bin/env bash
# Launch the Survivants project with Godot 4.
# Requires `godot4` to be available in PATH.

godot4 --path "$(dirname "$0")" "$@"
