#### User model

| Column name | data type |
| :---------: | :-------: |
|     id      |  integer  |
|  user_name  |  string   |
|    email    |  string   |
|  password   |  string   |

#### Task model

| Column name | data type |
| :---------: | :-------: |
|     id      |  integer  |
|   user_id   |  integer  |
|  task_name  |  string   |
| description |   text    |
|  deadline   | datetime  |
|   status    |  string   |
|  priority   |  string   |

#### Task_labels model

| Column name | data type |
| :---------: | :-------: |
|     id      |  integer  |
|   task_id   |  integer  |
|  label_id   |  integer  |

#### Labe model

| Column name | data type |
| :---------: | :-------: |
|     id      |  integer  |
| label_name  |  string   |


## Heroku deployment
 1. heroku login

 ```shell
 $ heroku login
 ```

 2. Precompile assets

 ```shell
 $ rails assets:precompile RAILS_ENV=production
 ```

 3. Comment ruby version on your Gem file
 
 ```shell
 source 'https://rubygems.org'
 git_source(:github) { |repo| "https://github.com/#{repo}.git" }
 # ruby '2.6.5'
 ```

 ```shell
 $ bundle install
 ```
4. Comment  and commit to git

 ```shell
 $ git add -A
 $ git commit -m "init"
 ```

 5. Create heroku app

 ```shell
 $ heroku create
 ```

 6. heroku stack settings

 ```shell
 $ heroku stack:set heroku-18
 ```

 6. Add heroku buildpack

 ```shell
 $ heroku buildpacks:set heroku/ruby
 $ heroku buildpacks:add --index 1 heroku/nodejs
 ```

 7. Deployment Settings Bundle and Linux Plataform ( if it is required)

 ```shell
 $ rm Gemfile.lock
 ```
 ```shell
 $ gem install bundler -v 2.2.11
 ```
 ```shell
 $ bundle lock --add-platform x86_64-linux
 ```
 ```shell
 $ git add -A
 $ git commit -m "Set bundler version to 2.2.11 and Linux plataform"
 ```
 8. Heroku deploy
 ```shell
 $ git push heroku step2:main
 ``` 
 9. Database migration

 ```shell
 $ heroku run rails db:migrate
 ```