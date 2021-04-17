#!/bin/bash
cleanup() {
    rm -rfv pkg src
    rm -rfv palamares
}

cleanup
makepkg -s