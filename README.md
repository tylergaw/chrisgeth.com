# Chrisgeth.com

Celebrity comedian Chris Gethard says good things a lot.

[![Build Status](https://travis-ci.org/tylergaw/chrisgeth.com.svg?branch=master)](https://travis-ci.org/tylergaw/chrisgeth.com)

## Setup

Copy `.env.example` to `.env` and update it's contents with the correct values. `.env` is ignored by Git.
```shell
cp .env.example .env
```

```shell
export TWITTER_KEY=key
export TWITTER_SECRET=secret
export YOUTUBE_KEY=key
export AWS_ACCESS_KEY_ID=access_key
export AWS_SECRET_ACCESS_KEY=secret_key
export S3_BUCKET=bucket
export S3_REGION=region
export TUMBLR_KEY=key
```

In any shell that you need to run the `rails s` or `rails c` you need to source the file with `source .env`.

**Install Ruby dependencies**. Don't forget to use the correct Gemset if you have that set up.
```shell
bundle install
```

**Create Database config**
```shell
touch config/database.yml
```

put something like this in there:
```yml
default: &default
  adapter: postgresql
  host: localhost
  username: your-username
  database: your-db-name
  pool: 5
  timeout: 5000

development:
  <<: *default

staging:
  <<: *default

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  <<: *default

production:
  <<: *default
```

**Install JS Packages** for the front-end build dependencies

install global packages: (there may be more)
```shell
npm install -g gulp
```

install local packages:
```shell
npm install
```

You'll want to build the front-end assets at least once so they're in place

```shell
gulp
```

Run `gulp watch` while you’re working. It’ll rebuild each time you make a change. When you add new css or js files you'll need to stop the watcher and restart it.

If you add new images or fonts, you'll need to stop the watcher, run `gulp copy-static`, and then start the watcher back up.

Cross your fingers and `rails s` then check [http://localhost:3000](http://localhost:3000)

## Build and Deploy

We're using Travis-CI to build the project and deploy it to Heroku. The build process is Gulp. It's main job is to compile Scss to CSS. We're using `gulp-rev` to append a unique revision number to name of all static asset files. There is an application helper `rev_manifest` to grab the correct number and append it to the files when they are linked to in the templates. This is for cache-busting purposes.

Static assets are hosted on AWS S3. There are currently dev, staging, and production buckets.

The last step of the deploy is to sync those assets with `rake asset_sync`. That happens when Travis as successfully deployed the project to Heroku.

## DNS
We're using AWS Route 53 for DNS.
