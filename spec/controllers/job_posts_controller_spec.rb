require 'rails_helper'

RSpec.describe JobPostsController, :type => :controller do
  describe '#scrape' do
    it 'Scrapes the weworkremotely website for new jobs' do
      expect( JobPost.all[0] ).to be_nil
      post :scrape

      expect( JobPost.all[0] ).not_to be_nil
    end
  end

  describe '#index' do
    xit 'Shows a list of all the job posts not marked as archived' do
      # Do stuff
    end
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
      # Do stuff
    end
  end

  describe '#destroy' do
    xit 'Marks the job post as archived'
  end
end
