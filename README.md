# README

Use this README to orrientaite yourself in the ruby ```

Most of what will be relevant to you is what is inside the app folder

  -Controllers - Inside the controllers folder there is a controller.rb file for ever object inside of our application. The controller defines actions for the given object.

  -Models - inside the models folder there will be .rb files for any object that we are storing data for. The objects are automatically stored in an SQL database, in the model file we can decided validation rules and associations between other models

  -Views - inside the views folder there will be other folders for each of the objects that we use in the application. Inside these subfolders there are .html.erb files which represent the front end of the website. An example is, the users folder contains 'show.html.erb' which is in charge of showing a given user from the users table. There is also 'index.html.erb' which shows a list of all users from the users table.

  This is the MVC structure of a rails application and is where most of everything important happens


Other important files

  -'routes.rb' can be found within the config folder. This file specifies all 'routes' within the rails application. This is what is used to determine what urls can be found within our website as well as internal routes that connect to the controllers.


  -'schema.rb' can be found within the db folder. This file contains all data that is to be hard stored in SQL, such as the users table. New tables can be added and modified by using 'rails generate' commands and using 'rails migrations'
```
