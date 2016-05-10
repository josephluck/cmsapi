## Prerequisites

Install ruby and postgresql if your machine does not already have it. Use the default installation directories for both to be on the safe side ;) Make sure postgresql is running on startup (so that you do not have to manually run it each time you want to develop)

## Ruby, rails & dependencies

The CMS API uses ruby 2.2.3 you can use rvm.io to use this particular version.

Once you've installed rvm & ruby 2.2.3 make 2.2.3 your default RVM version by running

```bash
rvm use --default 2.2.3
```

cd into the API directory and run:

```bash
$ bundle install
```

This will install all API dependencies.

## POW

Pow is used to serve the application locally under a domain name.

http://pow.cx/

Set up a symlink to cms-api.dev using the following:

```bash
$ cd ~/.pow
$ ln -s ~/apps/cmsapi cms-api
```

The API will be available at api.cms-api.dev

## Start up the app

```bash
$ rails server
```

## Restarting the app

If you need to re-start the server then run this from the api directory

```bash
$ touch tmp/restart.txt
```

## Debugging the app

Run this in the command line

```bash
$ bundle exec byebug -R localhost:3001
```

Happy developing!