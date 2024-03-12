if status is-interactive
  set fish_greeting

  fish_config theme choose "Rosé Pine Moon"

  set EDITOR nvim

  set -Ux SSH_AUTH_SOCK $(gpgconf --list-dirs agent-ssh-socket)
  gpgconf --launch gpg-agent

  fish_add_path ~/.local/bin
  fish_add_path ~/.cargo/bin
  fish_add_path ~/.local/share/bob/nvim-bin

  # starship init fish | source

  alias g "git"
  alias e "nvim"
  alias l "ls -al"

  zoxide init fish | source
end
