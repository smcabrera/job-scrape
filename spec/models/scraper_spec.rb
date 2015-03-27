require 'rails_helper'
require 'application_helper'

describe Scraper do
  describe '#pull_jobs' do
    xit "returns an array of JobPost objects" do

      page = double(page)
      allow(page).to receive()

      JobPost.all.each { |job| job.delete  }
      scraper = Scraper.new
      job_list = scraper.pull_jobs
      expect(job_list[0]).to be(true)
    end
  end
end
