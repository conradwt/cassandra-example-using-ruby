# Cassandra Example Using Ruby

The purpose of this step-by-step tutorial is to provide a very simple example of configuring and using the Cassandra database engine with the Ruby Language.

## Requirements

- Cassandra 4.1.3 or newer

- OpenJDK >= 11.0.11 and < 12

- Rails >= 5.2.8.1 and < 6

- Ruby >= 2.7.8 and < 3

Note: This tutorial was updated on macOS 13.5.2.

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
    wget https://downloads.apache.org/cassandra/4.1.3/apache-cassandra-4.1.3-bin.tar.gz
    ```

3.  Installing Cassandra

    ```zsh
    cd
    gzip -dc apache-cassandra-4.1.3-bin.tar.gz | tar xf -
    ```

4.  In the terminal, perform the following:

    ```zsh
    export CASSANDRA_VERSION=4.1.3
    export CASSANDRA_HOME=${HOME}/apache-cassandra-${CASSANDRA_VERSION}
    export PATH=${CASSANDRA_HOME}/bin:${PATH}
    export JAVA_HOME=`/usr/libexec/java_home -v 11`
    ```

    Note: If the above `JAVA_HOME` doesn't work for you, one can get the list of all installed JDKs using the following:

    ```zsh
     `/usr/libexec/java_home -V`
    ```

    Then update the `JAVA_HOME` environment variable with the value of the path for your `OpenJDK 11`.

6.  Start Cassandra

    ```zsh
    cassandra -f
    ```

7.  Open another terminal window

8.  Generate a new Rails application

    ```zsh
    gem install rails -v '5.2.8.1'
    rails _5.2.8.1_ new blog ---skip-active-record --skip-active-storage -T --skip-bundle --skip-webpack-install --skip-javascript --no-rc
    ```

9.  Add the Ruby cequel gem

    ```zsh
    cd blog
    bundle add i18n --version "= 1.8.11"
    bundle add cequel
    bundle add activemodel-serializers-xml
    ```

10.  Generate scaffold of the application

    ```zsh
    rails g scaffold post title body
    ```

11. Add the following as the first route within config/routes.rb file:

    ```ruby
    root 'posts#index'
    ```

12. Create app/models/post.rb file with the following content:

    ```ruby
    class Post
      include Cequel::Record

      key :id, :timeuuid, auto: true
      column :title, :text
      column :body, :text

      timestamps
    end
    ```

13. Create a default Cassandra configuration file

    ```zsh
    rails g cequel:configuration
    ```

14. Initialize Cassandra keyspace (database)

    ```zsh
    rails cequel:keyspace:create
    ```

15. Synchronize your Rails model schemas with Cassandra keyspace

    ```zsh
    rails cequel:migrate
    ```

16. Start the Rails server

    ```zsh
    rails s
    ```

17. Play with the application

    ```zsh
    open http://localhost:3000
    ```

---

## References

- [Apache Cassandra](http://cassandra.apache.org)

- [Cequel](https://github.com/cequel/cequel)

## Support

Bug reports and feature requests can be filed for the cassandra-example-using-rails project here:

- [File Bug Reports and Features](https://github.com/conradwt/cassandra-example-using-ruby/issues)

## Contact

Follow Conrad Taylor on Twitter ([@conradwt](https://twitter.com/conradwt))

## Creator

- [Conrad Taylor](http://github.com/conradwt) ([@conradwt](https://twitter.com/conradwt))

## License

This repository is released under the [MIT License](./LICENSE.md).

## Copyright

&copy; Copyright 2014 - 2023 Conrad Taylor. All Rights Reserved.
