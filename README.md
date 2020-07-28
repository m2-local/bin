# docker-lamp companion library

This project contains a bunch of BASH scripts to make your life interacting with your local Docker container much simpler (_we hope_)!

Some of the highlights of the project include:

* Simplified command line interface
* Single docker container for your Magento2 local project (as opposed to docker-compose, recommended M2 Docker stack)
* Apache for simplified webserver and php configuration (as opposed to Nginx + FPM)
* Companion extension to facilitate easy synchronization of upstream database and media (Work In Progress!!)

# TODO
* Where will app/etc/env.php come from ???
* Need to get Redis installed / configured
* XDebug config example
* LESS Watch example

## Configuring XDebug for PHP (PhpStorm)

## Watching LESS changes

## Customizing the Docker image

## Updating your application stack

## Scripting

## Adding to a Magento2 project

## Local System Requirements
* Git
* Docker
* Bash
* 10.5.0.0/16 subnet

## Install (automate as much of this as possible)
* git clone project ...
* git submodule init
* git submodule update
* bin/dkr-install
* Enter composer credentials when prompted
** Say Y to store in ~/.composer/auth.json

* 
* get initial DB / media export
* 
* configure ./composer/auth.json
* bin/dkr-exec -it composer global config http-basic.repo.magento.com
* dkr-pull
* mkdir -p dkr-data/mysql
* mkdir -p dkr-data/home
* npm install
* bin/magento module:enable --all

### Composer configuration
If you already have a `~/.composer/auth.json` file you can create the `~/.composer/`
`cp ~/.composer/auth.json ./`

## Assumptions
* Interaction with git will be done from the host system
** eg commits, push, pull...
* Your user inside the container is _www-data_
* 

## Running commands inside the container

The `dkr-exec` command will run commands from the host system as `www-data` from the `/var/www-data` directory, which is the home directory of `www-data`.

If you need to run an interactive command (in case a command prompts your for username & password for example), you can pass the `-it` flag.

## Connecting to the container

The `dkr-conn` command will open a BASH shell in the container as `www-data` in the `/var/www-data` directory

## Known limitations
* Some issues around multi-domain, in particular ability to "rebase" the database and configure the webserver