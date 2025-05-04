PATH=$PATH:/Users/martin/Documents/homer
PATH=$PATH:/Users/martin/Documents/homer/.//bin

##
# Your previous /Users/martin/.bash_profile file was backed up as /Users/martin/.bash_profile.macports-saved_2015-10-19_at_13:30:56
##

# MacPorts Installer addition on 2015-10-19_at_13:30:56: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

MACHTYPE=x86_64
export MACHTYPE

PATH=$PATH:/usr/local/bin/$MACHTYPE
PATH=$PATH:/Users/martin/Downloads/blat1
PATH=$PATH:/Users/martin/Downloads/TransDecoder-2.1.0
PATH=$PATH:/Users/martin/Downloads/proteinortho_v5-1.15
export PATH="$HOME/.npm-packages/bin:$PATH"



export PATH="$HOME/.node/bin:$PATH"
source ~/.node/lib/node_modules/npm/lib/utils/completion.sh
export PATH="/usr/local/bin:$PATH"

export NVM_DIR="/Users/martin/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export PATH=$PATH:~/.npm-global/bin/

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# added by Miniconda2 installer
export PATH="/Users/martin/miniconda2/bin:$PATH"

# Setting PATH for Python 3.11
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:${PATH}"
export PATH

# Setting PATH for Python 3.12
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:${PATH}"
export PATH

# rot13
alias rot13="tr 'A-Za-z' 'N-ZA-Mn-za-m'"
. "$HOME/.cargo/env"

alias multitool="sh /Users/martin/Documents/finns_coding/multitool/multitool.sh"
alias pmus="sh /Users/martin/Documents/finns_coding/bashy/pymussy.sh"
alias cmus-notify="sh /Users/martin/Documents/finns_coding/bashy/cmus+notify.sh"
alias get-lyrics="python3 /Users/martin/Documents/finns_coding/python/lyrics.py" 
alias playlistdown="sh /Users/martin/Documents/finns_coding/bashy/yt-dlp.sh"
alias slsk='open "/Users/martin/Wine Files/drive_c/Program Files/SoulseekNS/slsk.exe" -a "Wine"'
export HOMEBREW_NO_AUTO_UPDATE=1

export PATH=$PATH:/Users/martin/.spicetify
export HOMEBREW_NO_AUTO_UPDATE=1
export TERM=xterm-256color

# Created by `pipx` on 2025-04-17 16:08:29
export PATH="$PATH:/Users/martin/.local/bin"
export PATH="/usr/local/opt/openvpn/sbin:$PATH"
