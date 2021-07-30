# PROJECT TEMPLATE FOR RUBY BASED WEB APP WITH TEST SUITE AND DATABASE SET UP

## This is a template for a Ruby web app using Sinatra & PostgreSQL. Test suite will be handled by rspec/capybara. It is designed to get you up and running as soon as possible without the busy work so you can get to creating your apps fast!

### STEPS TO GET UP AND RUNNING

1. Click the green 'Use this template' button on the Github repo.

2. Give your repo a name and click 'Create repository from template'.

3. Github will initialize a new repo for you with the name you chose and will include all the necessary start up files structure.

4. Clone this repo to your text editor.

5. Run ```bundle install ``` to load the necessary gems.

6. Navigate to the config.ru and change 'AppName' to the name you want your app to be called.

7. Navigate to spec/spec_helper.rb and change 'AppName' to the same app name you entered into the config.ru file.

8. Navigate to app/app.rb and change 'AppName' to the same app name you entered into the config.ru and spec_helper.rb file.

9. To start the server, run ```rackup -p 3000``` in your terminal and then navigate to localhost:3000 in your browser.

10. Run ```rspec``` to make the initial default test pass and create a coverage folder in your project (You may want to .gitignore this folder before pushing)

11. Run ```psql``` and use the command in the db/migrations folder to create your database.

12. ENJOY!