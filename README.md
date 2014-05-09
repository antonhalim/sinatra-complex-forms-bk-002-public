---
tags: orm, activerecord, sinatra, rspec, forms
languages: ruby
---

# Sinatra Complex Forms

We are going to take another look at the Movie domain in this lab. You'll be creating and processing complex forms in which multiple objects are created and updated, and be dealing with many_to_many database associations.

## Instructions

We want to create a web app that serves as a mini IMDb. We'll be able to add movies to our database, associate them with actors and genres, and be able to view the movies that we've saved. Initially, you won't be creating all of the RESTful routes that you might want, just the barebones essentials, but once you've completed the lab, you may tweak the application to your heart's content.

### Notes

The basic outlines of your controllers and models (i.e., the class definitions) have been created for you, but you'll have to fill them in. Some migration files have been created for you (again, just outlines), but feel free to write them however you like. The names are only suggestions. You will also find some feature specs written, and a few pending controller and model specs.

To see what Rake tasks you have available to you, type `rake -T` on your command line.

The general application flow should be something like this:

(Note: Not all routes have been explicitly laid out for you. Don't forget the POST routes you need to make your forms work!)

1. Movies
  * I should be able to visit the following routes for a given movie
      1. `/movies`
      2. `/movies/new`
      3. `/movies/:id/actors`
      4. `/movies/:id/genres`
  * On the new page, I should be presented with a form that
      1. Has a text field for a title
      2. Has a text field for a comma separated list of actor names
      3. Has checkboxes for each of the existing genres
      4. Has a text field to add a genre that doesn't already exist
  * This means that when I create a new movie, I will have to either create or find each of the comma separated actors and associate them with the movie. I will also need to accept multiple genres via check boxes (and associate the corresponding genres with the movie), *and* allow for the creation of a brand new genre. This form has to do a lot!
  * The two different show pages should list the corresponding associations
  * The index (`/movies`) page should list each movie, and provide links to both show pages for each movie.

2. Actors
  * I should be able to visit the following routes for a given actor
      1. `/actors`
      2. `/actors/:id/movies`
      3. `/actors/:id/genres`
  * I do not need an `/actors/new` route, as I *only* create actors via the new movie form.

3. Genres
  * I should be able to visit the following routes for a given genre
      1. `/genres`
      2. `/genres/new`
      3. `/genres/:id/actors`
      4. `/genres/:id/movies`
  * The new page should
      1. Have a text field that accepts any number of comma separated genre names

This is pretty complex behavior, so take it slow! You are provided with some feature specs to guide you. You may employ any testing method you want, but you should, at some point, write both controller and model specs. Feel free to add more than are currently included. (I'd recommend using an Outside-In testing methodology, but it's totally up to you.)

## Bonus

1. Create the `/movies/:id/edit` route.
2. Ceate the rest of the RESTful routes you might want for this application.
