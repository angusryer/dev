# Developer Environment Setup

## Table of Contents

- [macOS Setup Guides](#macos-setup-guides)
- [System Preferences](#system-preferences)
- [Xcode](#xcode)
- [Homebrew](#homebrew)
- [Terminal](#terminal)
    - [Oh My Zsh](#oh-my-zsh)
- [Git](#git)
    - [SSH Config for GitHub](ssh-config-for-github)
    - [Git Ignore (global](git-ignore-global)
    - [Git GUIs](git-guis)
- [Vim](#vim)
    - [Browsersync](#browsersync)
- [rsync](#rsync)
- [Sublime Text](#sublime-text)
- [Sublime Text Packages](#sublime-text-packages)
- [Node.js](#nodejs)
- [Local React Environment](#local-react-environment)
- [Other Apps](#other-apps)

## macOS Setup Guides

- [sourabhbajaj.com/mac-setup/](https://sourabhbajaj.com/mac-setup/)
- [stuartellis.name/articles/mac-setup](https://www.stuartellis.name/articles/mac-setup/)
- [michaeluloth.com/how-to-set-up-a-mac-for-web-development](https://www.michaeluloth.com/how-to-set-up-a-mac-for-web-development)
- [mallinson.ca/posts/5/the-perfect-web-development-environment-for-your-new-mac](https://mallinson.ca/posts/5/the-perfect-web-development-environment-for-your-new-mac)

## System Preferences

### Initial Setup

The first thing you should do is update your OS to the latest version to have a more secure OS. To do that go: *Apple menu () > About This Mac > Software Update*.

### Users & Groups

- Enable *Show fast user switching menu* and select desired desplay option.
- Set up Password, Apple ID, Picture, etc.

### Keyboard

Open *System Preferences > Keyboard*.

- Set *Key Repeat* to *Fast* and Delay Until Repeat to one notch below *Short*.
- Remap *CapsLock* to *Esc* for quicker Vim mode switching. Click the *Modifier Keys...* button. In the dialog you can choose to map the caps lock key to escape.

#### Filco Majestouch

For keyboards not set up for macOS, swap the *Option* and *Command* keys. Open *System Preferences > Keyboard > Modifier Keys...* and remap both keys.

### Trackpad

- Point & Click
    - Enable *Tap to click with one finger*
- Scroll & Zoom
    - Uncheck all except *Zoom in or out* and *Scroll direction: Natural*
- More Gestures
    - Uncheck *Notification Center*

### Dock

- Uncheck
    - *Double-click a window's title bar to*
    - *Animate opening applications*
    - *Show recent applications in Dock*
- Check
    - *Automatically hide and show the Dock*

### Accessibility

- *Display* Check *Reduce transparency*

### Sound

- Disable *Play user interface sound effects*

### Finder

- General
    - Change New finder window show to open in your *Home Directory*
- Sidebar
    - Add Home and your Code Directory
    - Uncheck all Shared boxes
    - Uncheck *Tags*

### Menu Bar

- Remove the *Display* and *Bluetooth* icons
- Change battery to *Show percentage*

## Xcode

[Xcode](https://developer.apple.com/xcode/) is an integrated development environment for macOS containing a suite of software development tools developed by Apple for developing software for macOS, iOS, watchOS and tvOS.

For installing Xcode command line tools run:

```
$ xcode-select --install
```

It'll prompt you to install the command line tools. Follow the instructions and you'll have Xcode and Xcode command line tools both installed.

## Homebrew

[Homebrew](https://brew.sh/) calls itself The missing package manager for macOS and is an essential tool for any developer.

### Installation

Before you can run Homebrew you need to have the Command Line Tools for Xcode installed. It include compilers and other tools that will allow you to build things from source. See [previous section](#xcode).

To install Homebrew run the following in a terminal, hit Enter, and follow the steps on the screen:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

Then, to be able to use brew you need to start a new terminal session. After that you should make sure everything is working by running:

```
$ brew doctor
```

If everything is good, you should see no warnings, and a message that you are "ready to brew!".

## Terminal

### iTerm2

#### Font

Install Fira Code by running:

```
brew tap homebrew/cask-fonts && brew cask install font-fira-code
```

Fira Code repo is at [github.com/tonsky/FiraCode](https://github.com/tonsky/FiraCode).

#### Color Theme

Download `Tender.itermcolors` from [github.com/tombell/tender-iterm2](https://github.com/tombell/tender-iterm2). Go to *Preferences > Profiles > Colors* and select *Import...* from the *Color Presets...* dropdown. Import the theme and select it from the *Color Presets...* dropdown.

### Oh My Zsh

[Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) is an open source, community-driven framework for managing your zsh configuration. It comes with a bunch of features out of the box and improves your terminal experience.

Install Oh My Zsh:

```
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

To apply any configuration changes you make you need to either start new shell instance or run:

```
$ source ~/.zshrc
```

#### Fix Folder permission "Insecure completion-dependent directories detected"

Add `ZSH_DISABLE_COMPFIX=true` to the top of your .zshrc file. Reload the file by running `source .zshrc`.

## Git

Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.

Install Git:

```
$ brew install git
```

When done, to test that it installed properly you can run:

```
$ git --version
```

And which git should output `/usr/local/bin/git`.

Next, we'll define your Git user (should be the same name and email you use for [GitHub](https://github.com/):

```
$ git config --global user.name "Your Name Here"
$ git config --global user.email "your_email@youremail.com"
```

They will get added to your `.gitconfig` file.

To push code to your GitHub repositories, we're going to use the recommended HTTPS method (versus SSH). To prevent git from asking for your username and password every time you push a commit you can cache your credentials by running the following command, as described in the [instructions](https://help.github.com/articles/caching-your-github-password-in-git/).

```
$ git config --global credential.helper osxkeychain
```

### SSH Config for GitHub

The instructions below are referenced from the [official documentation](https://help.github.com/articles/generating-ssh-keys).

#### Check for existing SSH keys

First, we need to check for existing SSH keys by running:

```
$ ls -al ~/.ssh
# Lists the files in your .ssh directory, if they exist
```

Check the directory listing to see if you have files named either `id_rsa.pub` or `id_dsa.pub`. If you don't have either of those files then read on, otherwise skip the next section.

#### Generate a New SSH Key

If you don't have an SSH key you need to generate one. To do that you need to run the commands below, and make sure to substitute the placeholder with your email. The default settings are preferred, so when you're asked to "enter a file in which to save the key," just press Enter to continue.

```
$ ssh-keygen -t rsa -C "your_email@example.com"
# Creates a new ssh key, using the provided email as a label
```

#### Add Your SSH Key to the ssh-agent

Run the following commands to add your SSH key to the `ssh-agent`.

```
$ eval "$(ssh-agent -s)"
```

If you're running macOS Sierra 10.12.2 or later, you will need to modify your `~/.ssh/config` file to automatically load keys into the ssh-agent and store passphrases in your keychain. If no file exists, create one and add:

```
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_rsa
```

No matter what operating system version you run you need to run this command to complete this step:

```
$ ssh-add -K ~/.ssh/id_rsa
```

#### Adding a new SSH key to your GitHub Account

The last step is to let GitHub know about your SSH key. Run this command to copy your key to your clipboard:

```
$ pbcopy < ~/.ssh/id_rsa.pub
```

Then go to GitHub and [input your new SSH key](https://github.com/settings/ssh/new). Paste your key in the "Key" textbox and pick a name that represents the computer you're currently using.

### Git Ignore (global)

Create the file `~/.gitignore`. Add files that are almost always ignored in all Git repositories or the contents of [macOS specific .gitignore](https://github.com/github/gitignore/blob/master/Global/macOS.gitignore) maintained by GitHub itself.

followed by running the command below, in terminal:

```
$ git config --global core.excludesfile ~/.gitignore
```

### Git GUIs

I don't use them but they exist.

- [Sourcetree](https://www.sourcetreeapp.com/)
- [GitHub Desktop](https://desktop.github.com/)

## Vim

### Browsersync

[browsersync.io](https://www.browsersync.io/)

Install and run browser-sync inside of the project folder. Requires `node.js`. Refer to the [Node.js section](#nodejs). Install `browser-sync` globally:

```
npm install  -g browser-sync
```

After installing `browser-sync` we can run it inside any folder in our system and it will create a local server (automatically displaying the default index.html file you have in the folder).

```
browser-sync start --server --files .
```

### Color Scheme

Download `monokai.vim` from [github.com/crusoexia/vim-monokai](https://github.com/crusoexia/vim-monokai) and add it to the `~/.vim/colors` directory. If not already in the `.vimrc` file, add `colorscheme monokai`.

More useful color schemes at [github.com/rafi/awesome-vim-colorschemes](https://github.com/rafi/awesome-vim-colorschemes).

## Rsync

Rsync is a fast and extraordinarily versatile file copying tool. It can copy locally, to/from another host over any remote shell, or to/from a remote rsync daemon. It offers a large number of options that control every aspect of its behavior and permit very flexible specification of the set of files to be copied. It is famous for its delta-transfer algorithm, which reduces the amount of data sent over the network by sending only the differences between the source files and the existing files in the destination. Rsync is widely used for backups and mirroring and as an improved copy command for everyday use.

### Update rsync With Homebrew

Install

```
brew install rsync
```

Check version

```
rsync --version
```

### Basic Usage

The basic syntax is:

```
rsync <options> <source> <destination>
```

### Usage - Mirror Directory

```
rsync -acXNv --delete <source> <destination>
```

The options used are:

- `-a`, `--archive` archive mode; equals `-rlptgoD (no -H,-A,-X)`
- `-c`, `--checksum` skip based on checksum, not mod-time & size
- `-X`, `--xattrs` preserve extended attributes
- `-N`, `--crtimes` preserve create times (newness)
- `-v`, `--verbose` increase verbosity

### Documentation

- [rsync Manual](https://www.manpagez.com/man/1/rsync/)

## Sublime Text

### Set Default Editor in Terminal

Navigate to the home directory and open or create a file called `.bashrc`. Assuming the filepath is correct add the following to the file.

```
export EDITOR="/Applications/Sublime Text.app/Contents/MacOS/Sublime Text"
```

## Sublime Text Packages

### General Application

- [Package Control](packagecontrol.​io): A full-featured package manager.
- [PackageResourceViewer](github.com): Plugin to assist viewing and editing package resources in Sublime Text 2 and Sublime Text 3.
- [SideBarEnhancements](https://github.com/titoBouzout/SideBarEnhancements): Enhancements to Sublime Text sidebar. Files and folders.
- [Terminus](https://github.com/randy3k/Terminus): Bring a real terminal to Sublime Text.
- [Dictionaries](https://github.com/SublimeText/Dictionaries): Hunspell UTF8 dictionaries.

### Cleaner Code

- [SublimeLinter](https://github.com/SublimeLinter/SublimeLinter): The code linting framework for Sublime Text 3.
    - [SublimeLinter-html-tidy](https://github.com/SublimeLinter/SublimeLinter-html-tidy): SublimeLinter 3 plugin for html tidy.
- [HTML-CSS-JS Prettify](https://github.com/victorporof/Sublime-HTMLPrettify): HTML, CSS, JavaScript, JSON, React/JSX and Vue code formatter for Sublime Text 2 and 3 via node.js.


### Language Helpers

- [Markdown Extended](https://github.com/jonschlinkert/sublime-markdown-extended): Markdown syntax highlighter.
- [Monokai Extended](https://github.com/jonschlinkert/sublime-monokai-extended): Extends Monokai from Soda with additional syntax highlighting for Markdown, LESS, HTML, Handlebars and more.
- [Markdown Preview](https://github.com/facelessuser/MarkdownPreview): Markdown preview and build plugin for Sublime Text
- [Autoprefixer](https://github.com/sindresorhus/sublime-autoprefixer): Sublime plugin to prefix your CSS. *See troubleshooting*.
- [Sass](packagecontrol.io): Sass and SCSS syntax for Sublime Text.
- [Java​Script Enhancements](https://github.com/pichillilorenzo/JavaScriptEnhancements): JavaScript Enhancements is a plugin for Sublime Text 3. It offers not only a smart javascript autocomplete but also a lot of features about creating, developing and managing javascript projects (real-time errors, code refactoring, etc.).
    - [TerminalView](https://github.com/Wramberg/TerminalView): Terminal inside Sublime Text 3 view. *This plugin is dead*.
- [jQuery](https://packagecontrol.io/packages/jQuery): Sublime Text package bundle for jQuery.
- [Babel](https://github.com/babel/babel-sublime): Syntax definitions for ES6 JavaScript with React JSX extensions.
- [Babel Snippets](https://github.com/babel/babel-sublime-snippets): Next generation JavaScript and React snippets for Sublime.
- [HTML Boilerplate](https://github.com/sloria/sublime-html5-boilerplate): A Sublime Text 2/3 snippet to generate the HTML5 Boilerplate template.

### Troubleshooting

#### Enable key repeat in OS X for Sublime Text in Vim mode

Mac OS X Lion introduced a new, iOS-like context menu when you press and hold a key that enables you to choose a character from a menu of options. You can disable this feature for just Sublime Text by issuing the following command in your terminal (*not* the Sublime Text console):

```sh
defaults write com.sublimetext.3 ApplePressAndHoldEnabled -bool false
```

*Note: replace com.sublimetext.3 with whichever version of Sublime Text you are running eg. 'com.sublimetext.2'*

If you want this feature disabled globally, you can enter:

```sh
defaults write -g ApplePressAndHoldEnabled -bool false
```


#### Autoprefixer

**"Error: Browserlist: caniuse-lite is outdated."**

Delete:

```sh
/Library/Application Support/Sublime Text 3/Packages/Autoprefixer/node_modules/.bin
```

Change directory:

```sh
cd /Library/Application Support/Sublime Text 3/Packages/Autoprefixer/

npm rm autoprefixer

npm install autoprefixer
```

## Node.js

Install **Node Version Manager** with cURL.

```sh
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.35.2/install.sh | bash
```

Install multiple versions of Node.js.

```sh
nvm install 12.16.X
```

List available versions

```sh
nvm ls
```

Switching between versions

```sh
nvm use 12.16.X
```

### Troubleshooting

### Fix the "Missing write access" error when using npm

*Pay attention to the folder listed by the error message. If it’s different, update the chown command accordingly.*

Run this command:

```sh
sudo chown -R $USER /usr/local/lib/node_modules
```

## Local React Environment

1. Update node [nodejs.org](https://nodejs.org)
2. Install text editor syntax highlighting
    - [Babel](https://github.com/babel/babel-sublime): Syntax definitions for ES6 JavaScript with React JSX extensions.
    - [Babel Snippets](https://github.com/babel/babel-sublime-snippets): Next generation JavaScript and React snippets for Sublime.
3. Install `npm i -g react-static`

### Tools

[React Dev Tools](https://reactjs.org/blog/2015/09/02/new-react-developer-tools.htm)

## Other Apps

A list of apps that are generally good to use and can come in handy in day to day tasks.

### Developer Tools

- [Google Chrome](https://www.google.com/intl/en/chrome/browser/): Chrome is a developer friendly browser with powerful development tools built in to it.

### Productivity

- [Dropbox](https://www.dropbox.com/): File syncing to the cloud. It syncs files across all devices (laptop, mobile, tablet), and serves as a backup.
