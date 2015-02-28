require 'rails_helper'

RSpec.describe JobPostsController, :type => :controller do

  describe '#scrape' do
    it 'scrapes the weworkremotely website for new jobs' do
      expect( JobPost.all[0] ).to be_nil

      post :scrape
      expect( JobPost.all[0] ).not_to be_nil
    end
  end

  describe '#index' do
    xit 'shows a list of all the job posts not marked as archived' do
      JobPost.create(
        :title => "Genius Ninja Coder",
        :company => "Awesome company",
        :url => "https://weworkremotely.com/jobs/1000000"
      )
      JobPost.create(
        :title => "Genius Wizard Programmer",
        :company => "Fast Growing Startup",
        :url => "https://weworkremotely.com/jobs/9999999"
      )

      # Wait a minute...since this is just a get request and isn't altering the database in any way...is this the right way to test it?
      # Should I even be testing this in the controller? I feel like I know how I'd do this with capybara--just go to the page and check what's on it
      # Is this maybe not where this should go?
      get :index
      @job_posts
    end
  end

    xit 'does not list job posts that have been marked as archived' do
  end

  describe '#archived' do
    xit 'Shows a list of all the job posts marked as archived' do
      # Do stuff
    end
  end

  describe '#show' do
    xit 'Shows the information for a single job post' do
      # Do Stuff
    end
  end

  describe '#restore' do
    xit 'Takes archived job post and marks it as not archived' do
    end
  end

  describe '#destroy' do
    xit 'Marks the job post as archived' do
    end
  end
end
