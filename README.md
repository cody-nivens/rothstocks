# rothstock
This project is a two fold creature.  First is the Rails project and second is the setup to distribute a container for either Docker or Kubernetes.

RothStock started as an attempt to determine stocks for my Roth account years ago (read when I had money :)).

The idea is to 
* Buy stock that pays a dividend.
* Reinvest the dividend in more shares of the same stock.

This process gives a two fold return on an invenstment:
* First is the rising (one hopes) price of the stock.
* The second is the increased amount of stock (original stock + shares bought by dividend).

When initialized, the application has two users: palo@alto.com and jalo@alto.com.  Palo is an admin, Jalo is not.  The password is '12345689'.
Additionally, 881 stocks are loaded from a Champion Dividend Stock Excel spreadsheet from [The DRIP Investing Resource Center](http://www.dripinvesting.org/Tools/Tools.asp).

To set up the secrets for running this app, do the following.

```sh
$ bundle exec rake secret
8d428e9d27e3323f1b1ec0089482017480224c9984fc10327f95b0990ec46175d43d756fd644c3bca3703a337a94ced69c868ab0470ac201cd1b6a80c3f89e4a
```

Encode the secret key base using base64.

```sh
$ echo -n "8d428e9d27e3323f1b1ec0089482017480224c9984fc10327f95b0990ec46175d43d756fd644c3bca3703a337a94ced69c868ab0470ac201cd1b6a80c3f89e4a" | base64
OGQ0MjhlOWQyN2UzMzIzZjFiMWVjMDA4OTQ4MjAxNzQ4MDIyNGM5OTg0ZmMxMDMyN2Y5NWIwOTkwZWM0NjE3NWQ0M2Q3NTZmZDY0NGMzYmNhMzcwM2EzMzdhOTRjZWQ2OWM4NjhhYjA0NzBhYzIwMWNkMWI2YTgwYzNmODllNGE=
```

Next, encode the database credentials. Use the format DB_ADAPTER://USER:PASSWORD@HOSTNAME/DB_NAME. If you are using mysql with a user 'deploy' and a password 'secret' on 127.0.0.1 and have a database rothstocks, run

```sh
$ echo -n "mysql://deploy:secret@127.0.0.1/rothstocks"|base64
bXlzcWw6Ly9kZXBsb3k6c2VjcmV0QDEyNy4wLjAuMS90b2Rv
```

Parts of this project came from [Rails on Kubernetes](https://github.com/tzumby/rails-on-kubernetes.git), [Rails on Kubernetes - Part 2](https://blog.cosmocloud.co/rails-on-kubernetes-part-2/).

Other parts of this project came from [Rails on Kubernetes - Part 1](https://blog.cosmocloud.co/rails-on-kubernetes-part-1/).
