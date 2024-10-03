# kbzvim
## Fresh Install 
Follow these steps to install Neovim and set up your configuration.

- Update Your System
```bash
sudo pacman -Syu #distro specefic
```
- Install Neovim  
```bash
sudo pacman -S nvim #distro specefic
```
- Clone the Configuration Repository
```bash
git clone https://github.com/thekbbohara/nvim.git ~/.config/nvim
```
- Remove the Git History
```bash
rm -rf ~/.config/nvim/.git
```
- Launch Neovim
```bash
nvim
```
# Just wanna try my config
- Clone the Configuration Repository
```bash
git clone https://github.com/thekbbohara/nvim.git ~/.config/kbzvim
```
- Open with NVIM_APPNAME
```bash
NVIM_APPNAME=kbzvim nvim testfile
```

You are now ready to use Neovim with your custom configuration. Happy coding!"

