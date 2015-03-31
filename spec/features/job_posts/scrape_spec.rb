require 'rails_helper'
require 'spec_helper'


describe "Scraping weworkremotely.com" do
  it 'adds Job Posts to the database' do
    visit job_posts_path

    expect(JobPost.count).to be(0)

    click_link "Scrape!"

    expect(JobPost.count).to_not be(0)
  end
end
