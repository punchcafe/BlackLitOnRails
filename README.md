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
rails db:seed
```
From there, the page is ready to be accessed from `'/adminportal'`
**Note**: `rails db:seed` generates the required objects for manipulating text on the front page, as well as the **first administrator user**. This user will have credentials email: alpha` password:`helloworld`. It is **vitally** important that after setting up your server, you create a new administrator and delete `alpha`.

Additionally, if for whatever reason (such as you have changed the password salting environment variable), you must `run db:seed again`, it's extremely important to note that **this will create a new alpha user**, and such should be deleted immediately.

### `db:seed`
Running `db:seed` will seed required `PublicText` objects for the front page display, as well as a proto admin user.
If you need a new admin after changing the password salt environment variable, running `db:seed` will either create a new admin `alpha`, or if it already exists, update it's password to be useable with the current environment.



### Running a server
- run `> $ rails server` to host the site locally. Usually it will be hosted on `localhost:3000`.

### Running testing suites
- run `> $ rspec` in the root directory to execute all rspec test suites.
