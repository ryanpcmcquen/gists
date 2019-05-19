
     ,-----.,--.                  ,--. ,---.   ,--.,------.  ,------.
    '  .--./|  | ,---. ,--.,--. ,-|  || o   \  |  ||  .-.  \ |  .---'
    |  |    |  || .-. ||  ||  |' .-. |`..'  |  |  ||  |  \  :|  `--, 
    '  '--'\|  |' '-' ''  ''  '\ `-' | .'  /   |  ||  '--'  /|  `---.
     `-----'`--' `---'  `----'  `---'  `--'    `--'`-------' `------'
    ----------------------------------------------------------------- 


Setting up `haskell-vim-now` on a Cloud9 workspace:

  1. Start with a _Blank_ workspace.
  2. Increase resources (use at least `7GB` for disk and `2GB` for ram, but more is better).
  3. Edit `styles.css` to use a powerline font:
```css
@import url(https://cdn.rawgit.com/wernight/powerline-web-fonts/f3821a36beeba53e6e937319d4ee636ef30a352c/PowerlineFonts.css);
```
  4. Update `apt`:
```sh
sudo apt-get update
```
  5. Install the Haskell stack:
```sh
curl -sSL https://get.haskellstack.org/ | sh
```
  6. Install `haskell-vim-now`:
```sh
curl -L https://git.io/haskell-vim-now > /tmp/haskell-vim-now.sh
bash /tmp/haskell-vim-now.sh
```
  7. Enjoy!

### Optional

Switch to a newer version of `node` with `nvm`:
```sh
nvm install 6.9.2
nvm alias default 6.9.2
```

Uninstall any older versions:
```sh
nvm ls
nvm uninstall 4.6.1
```