# My Neovim Configuration

This repository contains my personal Neovim configuration, tailored to my preferences and workflow. Feel free to explore and adapt it to suit your needs.

### Suggested dependencies for telescope

- [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep) is required for
  `live_grep` and `grep_string` and is the first priority for `find_files`.

### Optional dependencies for telescope

- [sharkdp/fd](https://github.com/sharkdp/fd) (finder)
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) (finder/preview)
- [neovim LSP](https://neovim.io/doc/user/lsp.html) (picker)
- [devicons](https://github.com/nvim-tree/nvim-web-devicons) (icons)

## Getting Started

To use my Neovim configuration, follow these steps:

1. Install Neovim by referring to the official Neovim website: [https://neovim.io/](https://neovim.io/)

2. Install Packer, the plugin manager used in this configuration:

   ```shell
   git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
   ```

3. Clone this repository and navigate to the extracted directory:

   ```shell
   git clone https://github.com/rudimediaz/dotconfig-nvim.git
   cd dotconfig-nvim
   ```

4. Copy the configuration files:

   ```shell
   cp -r ./nvim ~/.config/nvim
   ```

5. Recompile Packer plugins:

   Launch Neovim and run the following command to sync and install the required plugins:

   ```
   :PackerSync
   ```

   This command uses Packer to download and install the specified plugins.

## Key Features

- **Plugins**: This configuration utilizes a carefully curated set of plugins to enhance the functionality and productivity of Neovim. You can find the list of plugins in the `nvim/lua/rudhi/plg.lua` file.

- **Keybindings**: The configuration includes custom keybindings that aim to optimize my editing workflow. You can find the keybindings in the `nvim/lua/rudhi/edt.lua` file. Feel free to explore and modify them according to your preferences.

## Customization

Feel free to customize this configuration to better suit your preferences. Here are a few suggestions:

- Add or remove plugins: Modify the `nvim/lua/rudhi/plg.lua` file and use Packer to manage the plugins according to your requirements.

- Customize keybindings: Open the `nvim/lua/rudhi/edt.lua` file and adjust the keybindings to match your desired workflow.

## Acknowledgements

I would like to express my gratitude to the Neovim community and the developers behind the plugins used in this configuration. Their hard work and dedication are greatly appreciated.
