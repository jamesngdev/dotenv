# Neovim & Tmux Configuration

This repository contains my custom configuration for Neovim and Tmux, aimed at enhancing productivity and efficiency. Below is an overview of the key bindings and features configured in each tool.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/jamesngdev/dotfiles.git
   ```
2. Copy the configurations to the appropriate directories:

   ```bash
   cp .tmux.conf ~/.tmux.conf
   cp -r nvim ~/.config/nvim
   ```

3. Install plugins in Neovim by opening Neovim and running `:PackerInstall`.

## Tmux Keymap

### General

- `Ctrl+b` - Default Tmux command prefix.
- `Ctrl+b c` - Create a new window.
- `Ctrl+b d` - Detach from session.
- `Ctrl+b ,` - Rename the current window.

### Window Navigation

- `Ctrl+b w` - List all windows.
- `Ctrl+b n/p` - Move to the next/previous window.
- `Ctrl+b %` - Split window vertically.
- `Ctrl+b "` - Split window horizontally.

## VIM Keymap

| Plugin/Functionality           | Keymap       | Mode | Description                              |
| ------------------------------ | ------------ | ---- | ---------------------------------------- |
| **General**                    | `jk`         | i    | Exit insert mode                         |
|                                | `<leader>nh` | n    | Clear search highlights                  |
|                                | `<leader>s`  | n    | Save file                                |
|                                | `<leader>q`  | n    | Fast quit                                |
|                                | `<leader>+`  | n    | Increment number                         |
|                                | `<leader>-`  | n    | Decrement number                         |
|                                | `<C-h>`      | n/i  | Move to left window/left                 |
|                                | `<C-l>`      | n/i  | Move to right window/right               |
|                                | `<C-j>`      | n/i  | Move to bottom window/down               |
|                                | `<C-k>`      | n/i  | Move to top window/up                    |
| **Window Management**          | `<leader>sv` | n    | Split window vertically                  |
|                                | `<leader>sh` | n    | Split window horizontally                |
|                                | `<leader>se` | n    | Make splits equal size                   |
|                                | `<leader>sx` | n    | Close current split                      |
| **Tab Management**             | `<leader>to` | n    | Open new tab                             |
|                                | `<leader>tx` | n    | Close current tab                        |
|                                | `<leader>tn` | n    | Go to next tab                           |
|                                | `<leader>tp` | n    | Go to previous tab                       |
|                                | `<leader>tf` | n    | Open current buffer in new tab           |
| **BarBar (Buffer Management)** | `<leader>bl` | n    | Buffer next                              |
|                                | `<leader>bh` | n    | Buffer previous                          |
|                                | `<leader>bd` | n    | Buffer delete                            |
| **Telescope**                  | `<leader>fo` | n    | Fuzzy find files                         |
|                                | `<leader>fr` | n    | Fuzzy find recent files                  |
|                                | `<leader>fs` | n    | Find string in current working directory |
|                                | `<leader>fc` | n    | Find string under cursor in cwd          |
|                                | `<leader>ft` | n    | Find todos                               |
| **VTSLS**                      | `<leader>cc` | n    | Clean unused code                        |
| **LSP**                        | `gD`         | n    | Go to declaration                        |
|                                | `gd`         | n    | Go to definition                         |
|                                | `K`          | n    | Show documentation (hover)               |
|                                | `gi`         | n    | Go to implementation                     |
|                                | `<space>wa`  | n    | Add workspace folder                     |
|                                | `<space>wr`  | n    | Remove workspace folder                  |
|                                | `<space>wl`  | n    | List workspace folders                   |
|                                | `<space>rn`  | n    | Rename                                   |
|                                | `<space>ca`  | n/v  | Code action                              |
|                                | `gr`         | n    | Go to references                         |
|                                | `<leader>f`  | n    | Format buffer                            |
| **CopilotChat**                | `<leader>sc` | n    | Toggle Copilot Chat                      |

## Contributing

Feel free to submit issues or pull requests if you have improvements or suggestions.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
