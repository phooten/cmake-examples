#!/bin/bash
docker run -v ~/.bashrc:/home/devuser/.bashrc -v /Users/phoot/code/gitlab/classes/github_cmake_examples-cmake:/home/devuser/code -it matrim/cmake-examples:3.5.1
