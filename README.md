# Cassandra Example Using Rails

The purpose of this step by step tutorial is to provide a very simple example of configuring and using Cassandra database engine with the Rails web framework for development.

## Requirements

- Cassandra 4.0.1 or newer

- Java >= 11.0.1 and < 12

- Rails 6.0.3.4 or newer

- Ruby 3.0.2 or newer

Note: This tutorial was updated on macOS 11.6.

## Communication

- If you **need help**, use [Stack Overflow](http://stackoverflow.com/questions/tagged/cassandra). (Tag 'cassandra')
- If you'd like to **ask a general question**, use [Stack Overflow](http://stackoverflow.com/questions/tagged/cassandra).
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## Installation, Setup, and Usage

1.  Open new terminal window

2.  Download Cassandra

    ```zsh
    cd
    wget https://downloads.apache.org/cassandra/4.0.1/apache-cassandra-4.0.1-bin.tar.gz
    ```

3.  Installing Cassandra

    ```zsh
    cd
    gzip -dc apache-cassandra-4.0.1-bin.tar.gz | tar xf -
    ```

4.  In the terminal, perform the following:

    ```zsh
    export CASSANDRA_VERSION=4.0.1
    export CASSANDRA_HOME=${HOME}/apache-cassandra-${CASSANDRA_VERSION}
    export PATH=${CASSANDRA_HOME}/bin:${PATH}
    ```

5.  Start Cassandra

    ```zsh
    cassandra -f
    ```

6.  Open another terminal window

7.  Generate a new Rails application

    ```zsh
    rails new blog ---skip-active-record --skip-active-storage -T --skip-bundle --skip-webpack-install --skip-javascript
    ```

8.  Add the Ruby cequel gem

    ```zsh
    cd blog
    bundle add cequel
    bundle add activemodel-serializers-xml
    ```

9.  Generate scaffold of the application

    ```zsh
    rails g scaffold post title body
    ```

10. Add the following as the first route within config/routes.rb file:

    ```ruby
    root 'posts#index'
    ```

11. Create app/models/post.rb file with the following content:

    ```ruby
    class Post
      include Cequel::Record

      key :id, :timeuuid, auto: true
      column :title, :text
      column :body, :text

      timestamps
    end
    ```

12. Create a default Cassandra configuration file

    ```zsh
    rails g cequel:configuration
    ```

13. Initialize Cassandra keyspace (database)

    ```zsh
    rails cequel:keyspace:create
    ```

14. Synchronize your Rails model schemas with Cassandra keyspace

    ```zsh
    rails cequel:migrate
    ```

15. Start the Rails server

    ```
    $ rails s
    ```

16. Play with the application

    ```zsh
    open http://localhost:3000
    ```

---

## References

- [Apache Cassandra](http://cassandra.apache.org)

- [Cequel](https://github.com/cequel/cequel)

## Support

Bug reports and feature requests can be filed for the cassandra-example-using-rails project here:

- [File Bug Reports and Features](https://github.com/conradwt/cassandra-example-using-rails/issues)

## Contact

Follow Conrad Taylor on Twitter ([@conradwt](https://twitter.com/conradwt))

## Creator

- [Conrad Taylor](http://github.com/conradwt) ([@conradwt](https://twitter.com/conradwt))

## License

This repository is released under the [MIT License](./LICENSE.md).

## Copyright

&copy; Copyright 2014 - 2021 Conrad Taylor. All Rights Reserved.
