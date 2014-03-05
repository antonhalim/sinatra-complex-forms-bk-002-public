require 'spec_helper'

describe "Genre Features" do
  describe "/genres" do
    before do
      @action = Genre.create(name: "Action")

      visit "/genres"
    end

    it "displays a list of genres" do
      expect(page).to have_content("Action")
    end

    it "displays the appropriate show links for each genre" do
      expect(page).to have_css("a[href='/genres/#{@action.id}/movies']")
      expect(page).to have_css("a[href='/genres/#{@action.id}/actors']")
    end
  end

  describe "/genres/new" do
    it "creates a new genre and redirects to the genres index page" do
      visit "/genres/new"

      fill_in "Name", with: "Adventure"
      click "Create"

      expect(page).to have_content("Adventure")
    end
  end

  describe "/genres/:id/actors" do
    before do
      family = Genre.create(name: "Family")
      @judy = Actor.create(name: "Judy Garland")
      family.actors << @judy
      family.save

      visit "/genres/#{family.id}/actors"
    end

    it "shows the genre's list of actors" do
      expect(page).to have_content("Judy Garland")
    end

    it "displays the appropriate show links for each actor" do
      expect(page).to have_css("a[href='/actors/#{@judy.id}/genres']")
      expect(page).to have_css("a[href='/actors/#{@judy.id}/movies']")
    end
  end

  describe "/genres/:id/movies" do
    before do
      thriller = Genre.create(name: "Thriller")
      @taken = Movie.create(title: "Taken")
      thriller.movies << @taken
      thriller.save

      visit "/genres/#{thriller.id}/movies"
    end

    it "shows the genre's list of movies" do
      expect(page).to have_content("Taken")
    end

    it "displays the appropriate show links for each movie" do
      expect(page).to have_css("a[href='/movies/#{@taken.id}/genres']")
      expect(page).to have_css("a[href='/movies/#{@taken.id}/actors']")
    end
  end
end