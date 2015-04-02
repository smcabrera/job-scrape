require 'rails_helper'
require 'application_helper'

describe Scraper do
  describe '#fetch_jobs' do
    it "saves job posts in the database for every post found on scraping target" do
      # Setup
      job_links = []
      job_links << instance_double('Mechanize::Page::Link', 'link1')
      job_links << instance_double('Mechanize::Page::Link', 'link2')
      attributes = {
        :url => 'jobsite.com/jobs/1',
        :company => 'ABC Company',
        :title => 'Designer'
      }
      job_post = instance_double("JobPost")
      url = "https://weworkremotely.com/categories/2/jobs"
      rxmatcher = /^.jobs.\d*$/
      scraper = Scraper.new(url, rxmatcher)
      allow(scraper).to receive(:find_job_links)
      # Exercise
      scraper.fetch_jobs

        # Verify


      #expect(scraper).to receive_messages(
        #:find_job_links => job_links,
        #:parse_link     => attributes,
        #:construct_job  => job_post
      #)
      expect(scraper).to receive(:find_job_links)
    end
  end
end
