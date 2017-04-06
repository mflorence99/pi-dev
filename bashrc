export PS1=" |\n\[\033[0;1;34m\] |                                                                                                   \r | \w \[\033[0m\]\n | \[\033[1;34m\]DEV \t => \[\033[0m\]"
export PS2=" | \[\033[1;34m\]DEV \t => \[\033[0m\]"

export DEV_DIR=/usr/src/app

# npm login via token
echo //registry.npmjs.org/:_authToken=${NPM_TOKEN} > ~/.npmrc

# universal aliases
alias la='ls --color=always -alFG'
alias less=more
alias ll='ls --color=always -FGlAhp'
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | more'

# project aliases
source $DEV_DIR/pi-docker/scripts/pi-alias.sh
