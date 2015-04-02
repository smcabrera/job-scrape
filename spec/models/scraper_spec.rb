require 'rails_helper'
require 'application_helper'
require 'pry'

describe Scraper do
  describe '#fetch_jobs' do
    it "saves job posts in the database for every post found on scraping target" do
      # Setup
      job_links = []
      job_links << instance_double('Mechanize::Page::Link', 'link1')
      job_links << instance_double('Mechanize::Page::Link', 'link2')
      scraper = Scraper.new('url', 'rxmatcher')
      allow(scraper).to receive(:find_job_links) do
        job_links
      end

      allow(scraper).to receive(:parse_link) do
        'return value'
      end

        allow(scraper).to receive(:construct_job) do
        'return value'
      end

      binding.pry

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
