require 'rails_helper'
require 'spec_helper'


describe "Archiving a job post" do
  it 'removes that job from the inbox' do
    JobPost.create(
      :title      => 'Engineer',
      :company    => 'Company',
      :url        => 'https://weworkremotely.com/jobs/9999',
      :deleted_at => nil
    )

    visit job_posts_path

    expect(JobPost.count).to eq(1)
    expect(page).to have_text('Engineer')

    click_link "archive"

    expect(page).not_to have_text('Engineer')
  end
end
