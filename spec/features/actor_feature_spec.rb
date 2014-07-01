require 'spec_helper'

describe 'Actor Features' do
  describe "/actors" do
    it "displays a list of actors" do
      keanu = Actor.create(name: "Keanu Reeves")

      visit '/actors'
      expect(page).to have_content("Keanu Reeves")
    end
  end

  describe "/actors/:id/movies" do
    before do
      @keanu = Actor.create(name: "Keanu Reeves")
      @movies = [Movie.create(title: "The Matrix"), Movie.create(title: "Hardball")]
      @keanu.movies << @movies
      @keanu.save

      visit "/actors/#{@keanu.id}/movies"
    end

    it "lists all of the actor's movies" do
      @movies.each do |movie|
        expect(page).to have_content(movie.title)
      end
    end

    it "has the appropriate show links for each movie" do
      @movies.each do |movie|
        expect(page).to have_css("a[href='/movies/#{movie.id}/genres']")
        expect(page).to have_css("a[href='/movies/#{movie.id}/actors']")
      end
    end
  end

  describe "/actors/:id/genres" do
    before do
      @keanu = Actor.create(name: "Keanu Reeves")
      @genres = [Genre.create(name: "Action"), Genre.create(name: "Thriller")]
      @movies = [Movie.create(title: "The Matrix"), Movie.create(title: "Hardball")]
      @movies[0].genres << @genres[0]
      @movies[1].genres << @genres[1]
      @keanu.movies << @movies
      @keanu.save

      visit "/actors/#{@keanu.id}/genres"
    end

    it "lists all of the actor's genres" do
      @genres.each do |genre|
        expect(page).to have_content(genre.name)
      end
    end

    it "has the appropriate show links for each genre" do
      @genres.each do |genre|
        expect(page).to have_css("a[href='/genres/#{genre.id}/movies']")
        expect(page).to have_css("a[href='/genres/#{genre.id}/actors']")
      end
    end
  end
end