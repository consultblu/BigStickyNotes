
 

My-Big-Sticky-Notes - Automated with Vagrant
================
    ______ _         _____                 _
    | ___ (_)       |  ___|               | |
    | |_/ /_  __ _  | |__  _ __ ___  _ __ | | ___  _   _  ___  ___
    | ___ \ |/ _` | |  __|| '_ ` _ \| '_ \| |/ _ \| | | |/ _ \/ _ \
    | |_/ / | (_| | | |___| | | | | | |_) | | (_) | |_| |  __/  __/
    \____/|_|\__, | \____/|_| |_| |_| .__/|_|\___/ \__, |\___|\___|
              __/ |                 | |             __/ |
             |___/                  |_|            |___/

Introduction
------------
This purpose of the repo is to demonstrate how the deployment of a ZF2 application can be completely automated.

Big Sticky Notes is web application built on of Zend Framework 2's Skeleton Application.  The Skeleton application is setup to run on Ubuntu 16, while Bik Sticky Notes is not.

In my revision of this app, I use Vagrant to spin up a CentOS 7 box and fully automate every component of this deployment.

Once you clone this repo, use Vagrant up and you're done.

See original code that i modified here: https://github.com/bigemployee/Big-Sticky-Notes


Installation
------------

## Using Vagrant

This skeleton includes a `Vagrantfile` based on ubuntu 16.04 (bento box)
with configured Apache2 and PHP 7.0. Start it up using:

```bash
$ vagrant up
```

THAT'S IT.  Since this is a demo that's all you need to do to get this puppy running.

The next steps beyond a demo would be to change you mysql password, and then update the app config to match the new credentials.



