### Getting Started

1. Install Neovim
2. Install Packer

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
3. install lsp servers
```bash
npm i --location=global vscode-langservers-extracted typescript typescript-language-server @tailwindcss/language-server
```

4. Copy file
```bash
cp -r ./nvim ~/.config/nvim
```
5. Recompile Packer

```
:PackerSync
```
