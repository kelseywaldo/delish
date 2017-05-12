# Recipe API Consumer

## Purpose
Create a web application that will display recipes based on a search term. We will utilize an API from Edamam called the [Recipe Search API](https://developer.edamam.com/edamam-recipe-api).

This is an individual, [stage 2](https://github.com/Ada-Developers-Academy/pedagogy/blob/master/rule-of-three.md) project.

## Learning Goals:
- Configure an API for consumption
- Create authenticated API requests using HTTParty
- Consume JSON responses from an API
- Map response to application-specific data
- Separate API logic from application logic


### Baseline
Before you start writing _any_ code:

- Explore the API documentation to become familiar with the request(s) you can make
- Create a Trello Board listing the features you will need to add and use it to track the progress of your app.

Once you've explored the API docs, this project:

- requires an individual **branch** and fork
- Use better_errors for debugging purposes
- requires you to create a Rails application
  - conform to Rails conventions on naming and inflection
  - by using `rails new .` you will create a new rails app _inside_ of the fork folder instead of creating a _new_ folder for your rails app
  - Deploy your completed app to Heroku
  
**You shall submit a pull request _with a meaningful pull request description_ once you are done with the baseline which shall be merged before moving onto implementing the requirements. _Do not push any additional code until your baseline PR has been merged_**


### Detailed Requirements  
**Search**:  
- The user shall type in a search term that will:
  - Make a request to the API using the search term
  - Display the results in a list to the user
  
**List View**:  
- This shall show a **paged** list of recipes for a given search term, _ten at a time_
- This view shall show the name of the recipe and the corresponding photo
- The view shall have a link from the recipe to a recipe show view

**Show View**:  
- This shall show the details about a given recipe. These details include:
  - Name
  - Link to the original recipe (opens in a new tab)
  - Ingredients
  - Dietary information
  
**Additional Requirements**:  
- One of the things that permits us to use this API, it providing attibution to the API's created. We must provide this somewhere on our site. Example locations include the footer or an about page. 
  - [Examples from the API site](https://www.dropbox.com/sh/ss34tnh4kyfxkxu/AADNJ_pB7Ou8_MVrYxgM4aQYa?dl=0&preview=Attribution+examples.pdf)
- You must also create tests for your API Wrapper & any classes as well as controller tests using VCR
- Your site must have a **responsive** look and feel, use semantic HTML as well as any grid formatting using Zurb Foundation

### Important Notes:
- Using this API as a developer limits the number of API calls in a month to 5000. This means that we must try to minimize API calls for testing purposes as much as possible, to ensure you do not exceed this number of API calls in the one week of development we have.


### Optional Requirements:
- Keep track of most recent search terms and allow user's to return to those searches
- Implement an OAuth strategy using Google
  - Allow users to save recipes to a "favorites" section that they can return to
-  Provide checkboxes or other controls to limit the search to options such as:
	-  Peanut Free
	-  Soy Free
	-  High Protien
	-  Etc
 
