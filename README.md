### Getting Started

- Install Neovim
- Install Packer

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
- install lsp servers
```bash
npm i --location=global vscode-langservers-extracted typescript typescript-language-server @tailwindcss/language-server
```
- clone this repo and go to dir where extracted

```bash
git clone https://github.com/rudimediaz/dotconfig-nvim.git
```

```bash
cd dotconfig-nvim
```

- Copy file
```bash
cp -r ./nvim ~/.config/nvim
```
- Recompile Packer

```
:PackerSync
```
