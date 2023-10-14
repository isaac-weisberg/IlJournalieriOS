# Setup

## Clone the repo
- `git clone https://github.com/isaac-weisberg/IlJournalieriOS.git` - downloads project
- go to cloned folder
- `git config user.email "your_email@example.com"`
- `git config user.name "Steven Beaven"`

## Install Homebrew

- https://brew.sh/ - the installation is easy

## Install rbenv

- `brew install rbenv ruby-build` - this install rbenv
- `rbenv init` - this writes the rbenv initialization into Terminal boot-up scripts
- Close and open terminal

More info: https://github.com/rbenv/rbenv

## Install Ruby using rbenv

- `rbenv install 3.2.2` - This downloads and installs the version
- `rbenv global 3.2.2` - This sets 3.2.2 as the global version

## Install project Gems

- Go to project folder
- `bundle config set --local path vendor/bundle` - makes sure, all gem dependencies are installed locally in `vendor/bundle`
- `bundle install` - downloads gem dependencies

## Install project Pods

- `bundle exec pod install`

## Open project

- `open IlJournalieriOS.xcworkspace`
