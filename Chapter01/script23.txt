# Define my colors for ls

LS_COLORS='no=00:di=01;46:ln=00;36:pi=40;33:so=00;35:bd=40;33;01'

export LS_COLORS

# My primary prompt

PS1='Hello $USER'; export PS1

# Applications I install outside the normal distro paths

PATH=$PATH:/opt/MySpecialApplication/bin; export PATH

# Shorthand for commands I use frequently

function lc
() { /bin/ls -C $* ; }
