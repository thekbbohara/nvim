# Setting Up a Fresh Neovim Installation
## Step-by-Step Guide 
Follow these steps to install Neovim and set up your configuration.

- Update Your System
```bash
sudo pacman -Syu
```
- 2. **Install Neovim**  
```bash
sudo pacman -S nvim
```
- 3. **Clone the Configuration Repository**  
```bash
git clone https://github.com/thekbbohara/nvim.git ~/.config/nvim
```
- 4. **Remove the Git History**  
```bash
rm -rf ~/.config/nvim/.git
```
- 5. **Launch Neovim**  
```bash
nvim
```

You are now ready to use Neovim with your custom configuration. Happy coding!"

