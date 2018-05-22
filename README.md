# xs-jinks

> Jenkins assistance scripts

## PROVISO: This is a work in progress, some parts working better than others.

## Makefile
```sh

$ make help
build                Build docker image
deploy               Deploy into field
help                 This help file
login                Login to docker hub
push                 Push to registry
ssh                  SSH into image
tag                  Tag docker image
test                 Test whatever needs testing

```

## jinks Bash script
```sh

$ jinks --help
    Script: jinks
    Purpose:
    Usage: jinks [-h|--help] [-v|--version]

    Options:
      --help:  help and usage
      --start: Start Jenkins using war file

      Jenkins from WAR:
      --ver: Version of Jenkins to start
      --versions: View local war versions
      --home=<jenkins home direcotry>: Directory to backup/restore, default: ~/.jenkins
      --file=<archive filename>: Archive filename (no path information required)
      --latest: Get the latest jenkins war versions, from updates.jenkins-ci.org
      --dist: Copy files from project to local script bin
      --dryrun|--dry-run: Just show expected source and destinations

      Jenkin in Docker:
      --up: start in docker container
      --down: bring down docker container
      --clean: stop dockler container & delete docker iamge
      --ssh: SSH into container
      --logs: attach to docker container logs

      Backup & Restore jenkins_home:
      --backup: Backup Jenkins home directory
      --restore: Restore Jenkins directory
      --archives: View archive files


    Examples:
      WAR:
        jinks --start
        jinks --start --ver=2.114
        jinks --start --ver=2.114 --dryrun
        jinks --stop
        jinks --stop --dryrun

      Docker:
        jinks --up
        jinks --restart
        jinks --down
        jinks --clean
        jinks --logs

      Backup & Restore:
        jinks --backup
        jinks --backup --home=~/jenkins_home
        jinks --restore --file=20180405.tgz
        jinks --restore --home=~/jenkins_home --file=20180405.tgz

      Helpers:
        jinks --latest
        jinks --archives
        jinks --versions

      Distribute (move files to script bin):
        jinks --dist

```
