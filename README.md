# Setting Up a Fresh Neovim Installation
## Step-by-Step Guide 
Follow these steps to install Neovim and set up your configuration.

### 1. **Update Your System**  
Start by ensuring your package database is up to date. This ensures you get the latest versions of all packages.
```bash
sudo pacman -Syu
```
### 2. **Install Neovim**  
Next, install Neovim using the package manager. This command will fetch and install Neovim on your system.
```bash
sudo pacman -S nvim
```
### 3. **Clone the Configuration Repository**  
Clone the custom Neovim configuration repository to your local machine. This provides you with a pre-configured setup to get started.
```bash
git clone https://github.com/thekbbohara/nvim.git ~/.config/nvim
```
### 4. **Remove the Git History**  
To avoid cluttering your configuration folder with unnecessary files, remove the Git history from the cloned repository.
```bash
rm -rf ~/.config/nvim/.git
```
### 5. **Launch Neovim**  
Finally, start Neovim to begin using your new setup. This opens the editor and loads your configuration.
```bash
nvim
```
## Conclusion
You are now ready to use Neovim with your custom configuration. Happy coding!"

