Specifications for the Sinatra Assessment

Specs:

    X Use Sinatra to build the app
        Sinatra, a domain specific language implemented in Ruby that gives access to pre-written methods that turn this app into a Ruby web app. 'sinatra' gem is required in the gemfile, Sinatra controllers in the config.ru file inherit from Sinatra::Base
    X Use ActiveRecord for storing information in a database
        both models inherit from ActiveRecord::Base, 'activerecord' and "sinatra-activerecord' are required in gemfile
    X Include more than one model class (e.g. User, Post, Category) 
        Job, User

    X Include at least one has_many relationship on your User model (e.g. User has_many Posts)
        User has_many jobs

    X Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
        Job belongs_to User
    X Include user accounts with unique login attribute (username or email)
        username and password on login page and signup page
    X Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
        Users can create a new job, view all jobs, view a specific job, edit a job, and delete a job
    Ensure that users can't modify content created by other users
    X Include user input validations
        users can't create a new job without a job title and job company
        Signup cannot happen without a username and password
    * BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
    X Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm

    X You have a large number of small Git commits
    X Your commit messages are meaningful
    X You made the changes in a commit that relate to the commit message
    X You don't include changes in a commit that aren't related to the commit message