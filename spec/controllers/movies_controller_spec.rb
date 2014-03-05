require 'spec_helper'

describe "MoviesController" do
  describe "GET /movies" do
    before do
      # Setup code here.
    end

    it "responds with a 200 status code" do
      pending
    end

    it "renders the movies index template" do
      pending
    end
  end

  describe "GET /movies/new" do
    before do
      # Setup code here.
    end

    it "responds with a 200 status code" do
      pending
    end

    it "renders the new movie form" do
      pending
    end
  end

  describe "POST /movies" do
    before do
      # Setup code here.
    end

    it "redirects to the movies index page" do
      pending
    end

    context "with a new genre" do
      it "creates a new movie and a new genre and new actors" do
        pending
      end
    end

    context "with existing genres" do
      it "creates a new movie and new actors" do
        pending
      end
    end
  end

  describe "GET /movies/:id/actors" do
    before do
      # Setup code here.
    end

    it "responds with a 200 status code" do
      pending
    end

    it "renders the show page for the movie's list of actors" do
      pending
    end
  end

  describe "GET /movies/:id/genres" do
    before do
      # Setup code here.
    end

    it "responds with a 200 status code" do
      pending
    end

    it "renders the show page for the movie's list of genres" do
      pending
    end
  end
end