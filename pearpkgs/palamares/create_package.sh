#!/bin/bash
cleanup() {
    rm -rfv pkg src
    rm -rfv palamares
}

makepkg -s