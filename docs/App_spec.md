# el-training

## About this curriculum

This document is a curriculum for new employee education to learn the basics of Ruby on Rails and its peripheral technologies, which are essential for Manyo.
Regardless of the ability of new employees, you will be required to carry out one step.
The training period is not specified.
Training will be completed when all steps are completed.

The following characters are assumed in this curriculum.

--New employee: A student of this curriculum.
--Supporter: We provide education, guidance, and advice for new employees. It also plays the role of consulting with new employees and deciding specifications together.

It is up to the supporter's discretion to determine how much the supporter is involved in the guidance. In addition, regarding the training period, the supporters will set a guideline in advance, taking into consideration the skill level of new employees and the status of internal projects.

## Overview

### System requirements

In this curriculum, you will develop a task management system as an issue.
The task management system wants to do the following:

――I want to easily register my task
--I want to be able to set an expiration date for a task
--I want to prioritize tasks
--I want to manage the status (not started / started / completed)
--I want to narrow down the tasks by status
--I want to search for a task by task name / task description
--I want to list the tasks. I want to sort on the list screen (based on priority, deadline, etc.)
――I want to classify tasks with labels etc.
--I want to register as a user so that I can see only the tasks I registered.

We also want the following management functions to meet the above requirements.

--User management function

### Support Browser

--Support browser is assumed to be the latest version of macOS / Chrome

### About application (server) configuration

I would like you to build using the following languages ​​and middleware (all are the latest stable versions).

--Ruby
--Ruby on Rails
--PostgreSQL

For the server, please use the following.

--Heroku

- Performance requirements and security requirements are not specified, but please make with general quality.
  If the response of the site is too bad, please improve it.

## Ultimate goal of this curriculum

At the end of this curriculum, it is assumed that you will learn the following items.

--Being able to implement basic web applications using Rails
--Being able to publish an application using a general environment in a Rails application
--Additional functions and data maintenance for published Rails applications
――To learn the flow of PR and merging on GitHub. Also, learn the Git commands needed for it.
--Being able to commit with appropriate particle size
--Being able to write a PR description properly
--Being able to respond to reviews and make corrections
--Being able to ask questions to team members and related parties (this time I will be a supporter) verbally or chat at the right time.

## Recommended books

We recommend the following books as recommended books for advancing the training curriculum.

-[Ruby on Rails 5 Quick Learning Practice Guide that can be used in the field] (https://book.mynavi.jp/ec/products/detail/id=93905)

The Ruby on Rails 5 Quick Learning Practice Guide that can be used in the field focuses on the task management system as well as the training curriculum.
Therefore, I think there are many points that can be helpful in advancing this training.

It also explains what was not covered in this training and how to proceed with team development. Please refer to it.

## Topic collection useful for development

I have summarized the topics I would like you to take advantage of in topics.md, although they were not included in any particular issue step. Please refer to and utilize it as necessary when implementing the curriculum.

## Challenge step

### Step 1: Build a Rails development environment

#### 1-1: Ruby installation

-Use [rbenv] (https://github.com/rbenv/rbenv) to install the latest version of Ruby.
--Make sure the Ruby version is displayed with the `ruby -v` command

#### 1-2: Rails installation

--Install Rails with Gem command
--Please install the latest version of Rails
--Make sure the Rails version is displayed with the `rails -v` command

#### 1-3: Installation of database (PostgreSQL)

--Let's install PostgreSQL on your OS
--For macOS, please install with `brew` etc.

### Step 2: Create a repository on GitHub

--Install Git at hand
--For macOS, please install with `brew` etc.
--Register your username and email address with `gitconfig`
--Let's think about the application name (= repository name)
--Let's create a repository
--If you don't have an account, get one
--Let's create an empty repository on it

### Step 3: Create a Rails project

--Create the minimum required directories and files for your application with the `rails new` command.
--Create a directory called `docs` directly under the project directory (application name directory) created by` rails new`, and commit this document file.
――This is to keep the specifications of this app under control so that you can see them at any time.
--Let's push the created application to the repository created on GitHub
--In order to specify the version, let's describe the version of Ruby to be used in `Gemfile` (Make sure that Rails already has the version).

### Step 4: Think about the image of the application you want to create

――Before designing, let's think about the completed image (with supporters) of what kind of app it will be. Screen design by paper prototyping is recommended
――Also, let's think about how this app will be used (whether it will be published on the Internet, for internal use, etc ...) (with supporters).
--Read the system requirements and think about the required data structure
――What kind of model (table) seems to be necessary?
――What kind of information is needed in the table?
――If you think about the data structure, let's write it by hand on the model diagram.
――When completed, take a picture and put it in the repository.
--Write the table schema in `README.md` (model name, column name, data type)

- It is not necessary to create the correct model diagram at this time. Let's make it as an assumption at the moment (Imagine repairing it if you think it is a mistake in the future steps)

### Step 5: Let's set the database connection (peripheral settings)

--First, let's cut a new topic branch with Git
――After that, I will work on the topic branch and commit.
--Install Bundler
--Install `pg` (PostgreSQL database driver) with` Gemfile`
--Let's set `database.yml`
--Let's create a database with the `rails db: create` command
--Let's check the connection to the database with the `rails db` command.
--Create a PR on GitHub for review
-If necessary, let him publicize with WIP (Work In Progress). Please refer to the topic collection for details.
――If you have a comment, please do so. If you have 2 LGTMs (Looks Good To Me), merge them into the master branch.

### Step 6: Let's set up RuboCop

-Set her RuboCop as Linter / Formatter
--In this curriculum, we will use [retrieva-cop] (https://github.com/retrieva/retrieva-cop) whose terms have been adjusted according to the creation of the Rails application.
--Install [retrieva-cop] (https://github.com/retrieva/retrieva-cop) with `Gemfile`
--Introduce Circle CI to run RuboCop when creating a PR
――It doesn't matter if the supporter implements it considering the difficulty level.
――After that, let's update the coding convention as needed while consulting with the supporter / reviewer.

### Step 7: Let's create a task model

Create CRUD to manage the task.
First, let's make it with a simple structure where only the name and details can be registered.

--Let's create the model class required for CRUD of the task with the `rails generate` command
--Create a migration and use it to create a table
――It is important to ensure that the migration can be returned to the previous state! Get in the habit of playing `redo` to check
――Be sure to set DB restrictions as well.
--Make sure you can connect to the database via the model with the `rails c` command
--At this time, let's try creating a record with ActiveRecord.
--Let's set validation
――Let's think about which validation should be added to which column.
--Create a PR on GitHub for review

### Step 8: Allow tasks to be viewed / registered / updated / deleted

Let's create a task list screen, detail screen, create screen, edit screen, and delete function.

Creating these features all at once tends to make your PR huge.
Therefore, in step 8, we will proceed with PR by dividing it into multiple parts.

Even in future steps, if the PR is likely to increase, consider whether you can issue the PR in two or more.

### Step 8-1: Create a task list screen and detail screen

--Let's make it possible to display the task created in step 7 on the list screen and detail screen.
--Let's create a controller and view with the `rails generate` command
――Let's decide which template engine to use in consultation with the supporters.
--Add the required implementations to your controller and view
--Edit `routes.rb` so that the task list screen is displayed at`http: // localhost: 3000 /`
--Let's explain to the supporters what is happening between the web browser and the server.
――――
