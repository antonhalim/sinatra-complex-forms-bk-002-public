require 'spec_helper'

describe "Movie Features" do
  describe "/movies" do
    before do
      @the_matrix = Movie.create(title: "The Matrix")

      visit "/movies"
    end

    it "displays a list of movies" do
      expect(page).to have_content("The Matrix")
    end

    it "displays the appropriate show links for each movie" do
      expect(page).to have_css("a[href='/movies/#{@the_matrix.id}/genres']")
      expect(page).to have_css("a[href='/movies/#{@the_matrix.id}/actors']")
    end
  end

  describe "/movies/new" do
    describe "creating a new movie with existing genres" do
      it "creates a new movie and redirects to the movies index page" do
        Genre.create(name: "Adventure")
        visit "/movies/new"

        fill_in "Movie Title", with: "Indiana Jones and the Last Crusade"
        fill_in "Actor names", with: "Harrison Ford, Sean Connery"
        check "Adventure"
        click_button "Create"
        expect(page).to have_content("Indiana Jones and the Last Crusade")
      end
    end

    describe "creating a new movie with all new genres and actors" do
      it "creates a new movie and redirects to the movies index page" do
        Genre.create(name: "Adventure")
        visit "/movies/new"

        fill_in "Movie Title", with: "The Wizard of Oz"
        fill_in "Actor names", with: "Judy Garland, Frank Morgan, Ray Bolger"
        check "Adventure"
        fill_in "Add New Genres", with: "Family"
        click_button "Create"

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