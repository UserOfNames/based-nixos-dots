#!/bin/sh
sudo nix flake update ~/.nixosdots && sudo nixos-rebuild switch --flake ~/.nixosdots
