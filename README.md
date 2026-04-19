# notify
Let Claude send messages to yourself from iMessage (macOS)

## Installation
Add your email variable to `.bashrc` or `.zshrc` file:
```
echo 'export NOTIFY_CONTACT="your.actual@email.com"' >> ~/.zshrc
```
Reinit terminal:
```
source ~/.zshrc
```
Make a local `bin/` folder to avoid messing with `sudo` and system files:
```
mkdir -p ~/.local/bin
```
Move the script to the folder:
```
mv notify.sh ~/.local/bin/notify
```
Set as executable:
```
chmod +x ~/.local/bin/notify
```
Add the local `bin/` folder to `PATH` if not there already:
```
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
```
Reinit terminal:
```
source ~/.zshrc
```
Try it out:
```
notify "your message here"
```
Voila!
