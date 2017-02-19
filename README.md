# Grape ActiveRecord Setup
Simple example application using [Grape](https://github.com/ruby-grape/grape), with added ActiveRecord support for generating database migrations, seeds and querying your data.

### Migrations
The projet has a rakefile that includes all activerecord rake tasks plus one to generate the migration files.
To generate a migration file, open a terminal and write:

```
rake db:generate_migration NAME=create_authors
```

### Seeds
You can create a `db/seeds.rb` file to generate seed data. The rake task that executes the `seeds.rb` file is called as follows:

```
rake db:seed
```

### Run

To run the application, open a terminal and start unicorn:

```
unicorn -c config/unicorn.rb
```
