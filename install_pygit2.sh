#!/bin/bash
libgit2_ver=$(dnf info --installed libgit2 | grep Version | cut -d : -f 2)
pip install pygit2==$(echo $libgit2_ver)
