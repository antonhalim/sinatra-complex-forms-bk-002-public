require 'spec_helper'

describe "Movie Features" do
  describe "/movies" do
    it "displays a list of movies" do
      action = Genre.create(name: "Action")
      keanu = Actor.create(name: "Keanu Reeves")
      the_matrix = Movie.create(title: "The Matrix")
      the_matrix.genres << action
      the_matrix.actors << keanu
      the_matrix.save

      visit '/movies'
      expect(page).to have_content("The Matrix")
    end
  end

  describe "/movies/new" do
    describe "creating a new movie with existing genres" do
      it "creates a new movie and redirects to the movies index page" do
        Genre.create(name: "Adventure")

        visit "/movies/new"

        fill_in "Title", with: "Indiana Jones and the Last Crusade"
        fill_in "Actors", with: "Harrison Ford, Sean Connery"
        check "Adventure"

        click "Save"

        expect(page).to have_content("Indiana Jones and the Last Crusade")
      end
    end

    describe "creating a new movie with all new genres and actors" do
      it "creates a new movie and redirects to the movies index page" do
        Genre.create(name: "Adventure")
        visit "/movies/new"

        fill_in "Title", with: "The Wizard of Oz"
        fill_in "Actors", with: "Judy Garland, Frank Morgan, Ray Bolger"
        check "Adventure"
        fill_in "Other Gners", with: "Family"

        click "Save"

        expect(page).to have_content("The Wizard of Oz")
      end
    end
  end

  describe "/movies/:id/actors" do
    it "shows the movie's list of actors" do
      judy = Actor.create(name: "Judy Garland")
      frank = Actor.create(name: "Frank Morgan")
      ray = Actor.create(name: "Ray Bolger")
      actors = [judy, frank, ray]

      oz = Movie.create(title: "The Wizard of Oz")
      
      oz.actors << actors
      oz.save

      visit "/movies/#{oz.id}/actors"

      actors.each do |actor|
        expect(page).to have_content(actor.name)
      end
    end
  end

  describe "/movies/:id/genres" do
    it "shows the movie's list of genres" do
      adventure = Genre.create(name: "Adventure")
      family = Genre.create(name: "Family")
      genres = [adventure, family]

      oz = Movie.create(title: "The Wizard of Oz")
      
      oz.genres << genres
      oz.save

      visit "/movies/#{oz.id}/genres"

      genres.each do |genre|
        expect(page).to have_content(genre.name)
      end
    end
  end
end