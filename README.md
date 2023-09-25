# Cassandra Example Using Ruby

The purpose of this step-by-step tutorial is to provide a very simple example of configuring and using the Cassandra database engine with the Ruby Language.

## Requirements

- [Docker Desktop](https://www.docker.com/products/docker-desktop) 4.23.0 or newer

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

2.  Create the project directory

    ```zsh
    mkdir blog
    cd blog
    ```

3.  Create `docker-compose.yml` file with the following content:

    ```yaml
    services:
      some-cassandra:
        image: cassandra:4.1.3
        container_name: some-cassandra
        environment:
          - CASSANDRA_CLUSTER_NAME=cassandra-cluster
        ports:
          - 9042:9042
        volumes:
          - cassandra-data:/var/lib/cassandra

    volumes:
      cassandra-data: {}
    ```

4.  Start a single node cluster

    ```zsh
    docker-compose up -d
    ```

5.  Check the status of your cluster

    ```zsh
    docker-compose exec some-cassandra nodetool status
    ```

    Note: One should see that the node status as Up Normal (UN) that looks similar to the following:

    ```text
    Datacenter: datacenter1
    =======================
    Status=Up/Down
    |/ State=Normal/Leaving/Joining/Moving
    --  Address     Load       Tokens       Owns    Host ID                               Rack
    UN  172.19.0.2  582.5 KB   256          ?       e61cf276-c860-4990-bf03-37161414aed2  rack1

    Note: Non-system keyspaces don't have the same replication settings, effective ownership information is meaningless
    ```

6.  Generate a new Rails application

    ```zsh
    gem install rails -v '5.2.8.1'
    rails _5.2.8.1_ new . ---skip-active-record --skip-active-storage -T --skip-bundle --skip-webpack-install --skip-javascript --no-rc
    ```

7.  Add the Ruby cequel gem

    ```zsh
    bundle add i18n --version "= 1.8.11"
    bundle add cequel
    bundle add activemodel-serializers-xml
    ```

8.  Generate scaffold of the application

    ```zsh
    rails g scaffold post title body
    ```

9.  Add the following as the first route within config/routes.rb file:

    ```ruby
    root 'posts#index'
    ```

10. Create app/models/post.rb file with the following content:

    ```ruby
    class Post
      include Cequel::Record

      key :id, :timeuuid, auto: true
      column :title, :text
      column :body, :text

      timestamps
    end
    ```

11. Create a default Cassandra configuration file

    ```zsh
    rails g cequel:configuration
    ```

12. Initialize Cassandra keyspace (database)

    ```zsh
    rails cequel:keyspace:create
    ```

13. Synchronize your Rails model schemas with Cassandra keyspace

    ```zsh
    rails cequel:migrate
    ```

14. Start the Rails server

    ```zsh
    rails s
    ```

15. Play with the application

    ```zsh
    open http://localhost:3000
    ```

16. Remove the keyspace

    ```zsh
    rails cequel:keyspace:drop
    ```

17. Stop a single node cluster

    ```zsh
    docker-compose down
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
