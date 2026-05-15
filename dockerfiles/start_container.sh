#!/bin/bash
docker run \
    -v ~/.bashrc:/home/devuser/.bashrc \
    -v /Users/phoot/code/gitlab/classes/github_cmake_examples-cmake:/home/devuser/code \
    -e TERM=xterm-256color \
    -it hooten:cmake
    # -it cmake-examples:3.26.6
    # -it matrim/cmake-examples:3.5.1
