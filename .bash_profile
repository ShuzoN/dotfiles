export PATH=/usr/local/bin:$PATH
eval "$(rbenv init -)"

[[ -s "$HOME/.proxyconf/proxyconf" ]] && source "$HOME/.proxyconf/proxyconf"
export PATH=/usr/local/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
