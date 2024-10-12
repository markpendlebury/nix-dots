# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# export PATH=$PATH:/run/current-system/sw/bin/

reloadbash() {
  

  # source $ZSH="$HOME/.oh-my-zsh"
  # Enable auto expansion of parameters and variables:
  zstyle ':completion:*' completer _expand _complete
  autoload -Uz compinit
  compinit

  SAVEHIST=1000 # Save most-recent 1000 lines
  HISTFILE=~/.zsh_history

  for script in ~/.scripts/*; do
    source $script
  done

  for script in ~/.scripts/non-commit/*; do
    # source $script
  done

  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

  SSH_PASSPHRASE=$(cat ~/.scripts/non-commit/passfile)

  { sleep .1; echo $SSH_PASSPHRASE; } | script -q /dev/null -c 'ssh-add ~/.ssh/keys/github-elesoft-bjss' &> /dev/null

}

reloadbash

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
