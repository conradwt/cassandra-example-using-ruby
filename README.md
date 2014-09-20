Cassandra Example Using Rails
=============================

## Requirements

- Ruby 2.1.2p95
- Rails 4.1.5
- Java 8

## Installation and Setup

1.  Open new terminal window

2.  Download Cassandra

    ```
    $ wget http://mirrors.ibiblio.org/apache/cassandra/2.1.0/apache-cassandra-2.1.0-bin.tar.gz
    ```

3.  Installing Cassandra

    ```
    $ cd
    $ gzip -d < apache-cassandra-2.1.0-bin.tar.gz | tar xvf -
    ```

4.  Start Cassandra

    ```
    $ cassandra -f
    ```
5.  Open another terminal window

6.  Generate a new Rails application

    ```
    $ rails _4.1.5_ new blog --skip-active-record --skip-bundle
    ```

7.  Add the Ruby cequel gem

    ```
    $ cd blog
    $ echo "gem 'cequel'" >> Gemfile
    $ bundle
    ```

8.  Generate scaffold of the application

    ```
    $ rails g scaffold post title body
    ```

9.  Add the following as the first route within config/routes.rb file:

    ```ruby
    root 'posts#index'
    ```

10.  Copy the following into app/models/post.rb file:

    ```ruby
    class Post
      include Cequel::Record

      key :id, :timeuuid, auto: true
      column :title, :text
      column :body, :text

      timestamps
    end
    ```

11.  Create a default Cassandra configuration file

    ```
    $ cd ../..
    $ rails g cequel:configuration
    ```

12.  initialize Cassandra keyspace (database)

    ```
    $ rake cequel:keyspace:create
    ```

13.  synchronize your Rails model schemas with Cassandra keyspace

    ```
    $ rake cequel:migrate
    ```

14.  run the Rails server

    ```
    $ rails s
    ```

15. Play with the application

    ```
    $ open http://localhost:3000
    ```
---

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

&copy; Copyright 2014 Conrad Taylor. All Rights Reserved.
