@echo off
REM Launch the Survivants project with Godot 4.
REM Requires godot4 to be available in PATH.

godot4 --path %~dp0 %*
