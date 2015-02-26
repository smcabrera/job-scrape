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
