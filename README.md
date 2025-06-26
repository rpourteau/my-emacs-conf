# My Emacs Config

It you clone it with the command below it should clone the repository content in .emacs.d and be ready to use:

```bash
git clone https://github.com/rpourteau/my-emacs-conf.git .emacs.d
```

# Font
I personally got used to "Courier new" in weight 110, which is set in [ui.el](./config/ui.el). But it might not be installed by default on Linux.

It can be installed by running the below command:

```bash
sudo apt install ttf-mscorefonts-installer
```


# Icons doom-modeline

Icons for doom-modeline need to be installed.

## On Linux

Simply run the two emacs commands and relaunch emacs.

```bash
M-x all-the-icons-install-fonts
```

```bash
M-x nerd-icons-install-fonts
```

## On Windows
The commands were already ran and the icons are in [all-the-incons-font](all-the-incons-font).
To install them, double clicking each ttf files and select install. Relaunch emacs.
