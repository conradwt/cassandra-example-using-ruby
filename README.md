Cassandra Example Using Rails
=============================

The purpose of this step by step tutorial is to provide a very simple example of configuring and using Cassandra database engine with the Rails web framework for development.

## Requirements

- Ruby 2.4.1p111
- Rails 5.1.3
- Java 8

Note:  This tutorial was created on Mac OS X 10.13 beta 6.

## Communication

- If you **need help**, use [Stack Overflow](http://stackoverflow.com/questions/tagged/cassandra-3.0). (Tag 'cassandra-3.0')
- If you'd like to **ask a general question**, use [Stack Overflow](http://stackoverflow.com/questions/tagged/cassandra-3.0).
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## Installation, Setup, and Usage

1.  Open new terminal window

2.  Download Cassandra

    ```
    $ cd
    $ wget http://www-us.apache.org/dist/cassandra/3.11.0/apache-cassandra-3.11.0-bin.tar.gz
    ```

3.  Installing Cassandra

    ```
    $ cd
    $ gzip -dc apache-cassandra-3.11.0-bin.tar.gz | tar xf -
    ```

4.  Update .profile with the following lines:

    ```
    # set environment variables for Cassandra.
    export CASSANDRA_VERSION=3.11.0
    export CASSANDRA_HOME=${HOME}/apache-cassandra-${CASSANDRA_VERSION}
    export PATH=${CASSANDRA_HOME}/bin:${PATH}
    ```

    Then execute the following command within the terminal:

    ```
    $ . ~/.profile
    ```
5.  Start Cassandra

    ```
    $ cassandra -f
    ```
6.  Open another terminal window

7.  Generate a new Rails application

    ```
    $ rails _5.1.3_ new blog -T --skip-active-record --skip-bundle
    ```

8.  Add the Ruby cequel gem

    ```
    $ cd blog
    $ echo "gem 'cequel'" >> Gemfile
    $ echo "gem 'activemodel-serializers-xml'" >> Gemfile
    $ bundle
    ```

9.  Generate scaffold of the application

    ```
    $ rails g scaffold post title body
    ```

10.  Add the following as the first route within config/routes.rb file:

     ```ruby
     root 'posts#index'
     ```

11.  Create app/models/post.rb file with the following content:

     ```ruby
     class Post
       include Cequel::Record

       key :id, :timeuuid, auto: true
       column :title, :text
       column :body, :text

       timestamps
     end
     ```

12.  Create a default Cassandra configuration file

     ```
     $ rails g cequel:configuration
     ```

13.  Initialize Cassandra keyspace (database)

     ```
     $ rake cequel:keyspace:create
     ```

14.  Synchronize your Rails model schemas with Cassandra keyspace

     ```
     $ rake cequel:migrate
     ```

15.  Disable ActiveRecord configuration within `config/environments/development.rb`
     by doing the following:

     ```
     # config.active_record.migration_error = :page_load
     ```

16.  Start the Rails server

     ```
     $ rails s
     ```

17. Play with the application

    ```
    $ open http://localhost:3000
    ```
---

## References

* [Apache Cassandra](http://cassandra.apache.org)

* [Cequel](https://github.com/cequel/cequel)

## Support

Bug reports and feature requests can be filed for the cassandra-example-using-rails project here:

* [File Bug Reports and Features](https://github.com/conradwt/cassandra-example-using-rails/issues)

## Contact

Follow Conrad Taylor on Twitter ([@conradwt](https://twitter.com/conradwt))

## Creator

- [Conrad Taylor](http://github.com/conradwt) ([@conradwt](https://twitter.com/conradwt))

## License

This repository is released under the [MIT License](http://www.opensource.org/licenses/MIT).

## Copyright

&copy; Copyright 2014 - 2017 Conrad Taylor. All Rights Reserved.
