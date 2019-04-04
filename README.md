# BlackLitOnRails

**This is still a work in progress**

BlackLitOnRails is a rails based website for the podcast *Black Lit Function*.
You can see the deployed version [here](http://blacklitfunction.herokuapp.com/).

## Getting started

### Database
BlackLitOnRails uses a `postgresql` connection, so you'll need to [download](https://www.postgresql.org/download/), install and start running `postgresql` locally.

### Set up
- clone this repo so you have it locally
- run `> $ bundle install` to download all gem file dependencies
- run
```bash
rails db:create
rails db:migrate
```
to generate the necessary database configurations.

### Running a server
- run `> $ rails server` to host the site locally. Usually it will be hosted on `localhost:3000`.

### Running testing suites
- run `> $ rspec` in the root directory to execute all rspec test suites.
