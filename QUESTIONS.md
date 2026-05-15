Open questions:
 - What does the EX3 flag do C++
 - What are some examples of flags that should be linked with the target in additio
    to the library? i.e. if I link EX3 to a lib as PUBLIC, why should the executable
    also get this? Must be library specific
- Note this example: `set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DEX2" CACHE STRING "Set C++ Compiler Flags" FORCE)`
    Whats does the Cache string do?
        -> THink it adds a comment to the CMAKE_CXX_FLAGS variable
        -> Think it updates the varaible as CACHEd. Just thought that would go before the var.

What is the difference between g++ and clang?
What's the difference between c++11 and gnu++11?
what is GNU?

# MAN
- Can you flip pages in man? i.e. docker only has one small page, so not super helpful. man -a isn't helping.
- How do I view rst files? i.e. /opt/homebrew/share/cmake
        There are a few RST conversion files installed by default
- How do I open the /opt location on mac in vscode?

# CMAKE
- When offline, how do I find commands / wiki for things?
    still can't find what 'ROOT_DIRECTORY' or 'GET_ROOT_DIRECTORY' do in the share directory
- Can i just pass flags to cmake, i.e. if I want to pass '-d' to debug?
- Cache string:
        I would have expected this string to show up in the cmake_cache files, but it doesn't look like it is
            "# Set a default C++ compile flag
            set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DEX2" CACHE STRING "Set C++ Compiler Flags" FORCE)"

# Docker
## Questions
- Why can't run 'docker start -ia'? WHy is only '-i' recommended>
- What is the difference between docker start and docker attach

## Notes
When starting a container, an IP address is assigned: 172.17.0.x



# TMUX
- How do I save a configuration with multiple windows already up?
- How to list all the sessions open. (accidentally stopped one session, but think another is still open)
- Still can't navigate around the screen


# Documentation
- Whats the difference between md (Markdown), adoc (?), rst (Restructured Text), etc.



# Notes:
## Port / Graphics forwarding
I'm trying to get cmake-gui running from the container and forward X11 graphics back to the MacOS.
Initial thoughts are I could enable some ports to talk between the container and MacOS. Then the
question is how to I forward graphics from the container back and forth to the Mac?

Another thought is I can somehow just pass text informaiton back and forth and have the processing
happen on the Mac side. I can set up a PTY from the Mac side give / talk to the container.
I know I'm misinformed, but that was my first thought on how to make it work.


### Explaination about what's going on
#### ccmake (port forwarding)
PTY gives the container a terminal to talk to. Recall it acts as a screen/keyboard combo, so basically
is saying 'hey, i'm able to show the use things via text based interface. When you attach to a
docker container via `-it`, MAC is giving the container the PTY. ccmake only relies on text based
interfaces, so that works fine.

Questions:
    When I run ccmake on the terminal, what exactly is happening?
    (Guess):
        the command is executed from the PTY that directs the command to the container.
        Any responses get forwarded back to the PTY, thus back to the MAC which initiated
        the PTY. (this answer is actually correct)
    (Actual Answer):
            ccmake uses the cursor library to render text and cursor. The PTY terminal
            renders the text and displays it. The "protocol" is ANSI escape of PTY stream.
            This is very simply and light weight

#### cmake-gui (X11 forwarding)
cmake-gui uses X11 display server to draw windows that a PTY cannot provide. Ports don't help
because the GUI doesn't uses ports to listen. It uses the X11 communication protocal, unlike
the HTTP protocol.

X11 actually does forward data over port 6000
X11 - 6000 (+ display number, so 6001 for display :1)
VNC - 5900 (+ display number, so 5901 for display :1)
RDP - 3389




