# Developer Environment Setup

## Table of Contents

- [macOS Setup Guide](#macos-setup-guide)
- [Xcode](#xcode)
- [Homebrew](#homebrew)
- [Git](#git)
- [rsync](#rsync)
- [Sublime Text](#sublime-text)
- [Sublime Text Packages](#sublime-text-packages)
- [Node.js](#nodejs)
- [Local React Environment](#local-react-environment)
- [Other Apps](#other-apps)

## macOS Setup Guide

### Links

- [sourabhbajaj.com/mac-setup/](https://sourabhbajaj.com/mac-setup/)
- [stuartellis.name/articles/mac-setup](https://www.stuartellis.name/articles/mac-setup/)
- [michaeluloth.com/how-to-set-up-a-mac-for-web-development](https://www.michaeluloth.com/how-to-set-up-a-mac-for-web-development)
- [mallinson.ca/posts/5/the-perfect-web-development-environment-for-your-new-mac](https://mallinson.ca/posts/5/the-perfect-web-development-environment-for-your-new-mac)
### Fix the "Missing write access" error when using npm

*Pay attention to the folder listed by the error message. If it’s different, update the chown command accordingly.*

Run this command:

```sh
sudo chown -R $USER /usr/local/lib/node_modules
```

### Enable key repeat in OS X for Sublime Text in Vim mode

Mac OS X Lion introduced a new, iOS-like context menu when you press and hold a key that enables you to choose a character from a menu of options. You can disable this feature for just Sublime Text by issuing the following command in your terminal (*not* the Sublime Text console):

```sh
defaults write com.sublimetext.3 ApplePressAndHoldEnabled -bool false
```

*Note: replace com.sublimetext.3 with whichever version of Sublime Text you are running eg. 'com.sublimetext.2'*

If you want this feature disabled globally, you can enter:

```sh
defaults write -g ApplePressAndHoldEnabled -bool false
```

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

Before you can run Homebrew you need to have the Command Line Tools for Xcode installed. It include compilers and other tools that will allow you to build things from source, and if you are missing this it's available through the App Store > Updates. You can also install it from the terminal by running the following:

```
$ sudo xcode-select --install
```

To install Homebrew run the following in a terminal, hit Enter, and follow the steps on the screen:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

Then, to be able to use brew you need to start a new terminal session. After that you should make sure everything is working by running:

```
$ brew doctor
```

If everything is good, you should see no warnings, and a message that you are "ready to brew!".

## Git

Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.

For installation and configuration *see [links](#links)*

### Git GUIs

- [Sourcetree](https://www.sourcetreeapp.com/)
- [GitHub Desktop](https://desktop.github.com/)

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
