# Rothstocks

RothStocks is a front end to the data from [The DRIP Investing Resource Center](http://www.dripinvesting.org/Tools/Tools.asp) which presents their data in the form of spreadsheets.  
It allows for the creation of a portfolio to track stocks and the DRIP investments that come from the stocks paying dividends.  Stock data is collected once per day and stored in a Redis database.  The historical data from the DRIP center is stored in a regular database.

## Getting started

This is a standard Rails project.
```sh
git clone https://github.com/cody-nivens/rothstocks.git
cd rothstocks
bundle install
rake db:create && rake db:migrate && rake db:seed
rails s
```
### Prerequisites

This project assumes a MySQL server for its database functions.

### Installing

The seed data is loaded from a series of spreadsheets collected over that last several years.  I have included sheets from the last 2 years.  
The seeds.rb contains code to translate the sheets as they have evolved over the years.  The seeds.rb code contains code for at least the last 5 years.

## Deployment

The Jenkinsfile creates two images using Dockerfile.  One image is for testing and has the testing environment.  These images are used with
a set of Kubernetes yaml files in k8s/ to create a test job which runs the Rails tests using rake db:test; a setup job which
 creates a database, does the database table migrations and adds data using rake db:seed.  
These yaml files are set up to run under [Kubernetes](https://github.com/cody-nivens/kube-ci-cd-update) as an example of development -> Repo -> Jenkins -> Kubernetes.

When the setup job is run, it will process two years worth of speadsheets covering the Dividend Championship stocks.  This includes the monthly data for 
881 stocks that is loaded from the Champion Dividend Stock Excel spreadsheets from [The DRIP Investing Resource Center](http://www.dripinvesting.org/Tools/Tools.asp).
Additionally, two users will be installed: palo@alto.com and jalo@alto.com.  Palo is an admin, Jalo is not.  The password is '12345689' for both.

## Built with

* *datagrid* - displays information in a table format.  Allows for filtering in a complex manner, sorting on any column, the ability to format and manipulate the data in a column.
* *stock_quote* - Provides access to stock data from IEX
* *redis* - Provides storage for daily stock values.
* *redis-namespace* - Namespacing the Redis store
* *redis-rails* - Glue to make Redis work with Rails
* *redis-rack-cache* - Using Redis as a cache for Rails
* *groupdate* - Group data by date.  The output from mysql\_tzinfo\_to\_sql /usr/share/zoneinfo must be available on the MySql server for this gem to work correctly.
* *chartkick* - Allows for creating a line chart for an ActiveRecord collection of records.

## Acknowledgements

Parts of this project came from the following:
1.  [Rails on Kubernetes](https://github.com/tzumby/rails-on-kubernetes.git)
2.  [Rails on Kubernetes - Part 2](https://blog.cosmocloud.co/rails-on-kubernetes-part-2/).
3.  [Rails on Kubernetes - Part 1](https://blog.cosmocloud.co/rails-on-kubernetes-part-1/).
