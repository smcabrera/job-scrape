This app is a little personal project I've decided to make public. Scrapes the websites of certain job sites and then saves them to a database for you. Right now I only have a scraper written for weworkremotely.com. Hoping to add more sites soon.

## Install

Assuming you already have ruby installed, just clone the repo and run
```
bundle install
```

to get the dependencies. Then run:
```
rake db:migrate
```
to set up the database schema. Then all you need to do is open up the site and click on "scrape!" to get all the latest jobs from the respective job sites (right now just weworkremotely.com)

This script is meant to grab all the programming jobs from weworkremotely and organize them based on various characteristics.

### It should make a list of all jobs and be able to list them by name.
The method get_jobs should return a list of all the available programming jobs on the site
### It should then be able to filter them based on jobs that mention ruby in their title
### It should also be able to filter based on jobs that are senior positions
### For any given job it should give you relelvant information about that job like the company and the url to description
