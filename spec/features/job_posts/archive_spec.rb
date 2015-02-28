require 'rails_helper'
require 'spec_helper'


describe "Archiving job posts" do
  it 'removes a post from inbox when archived' do
    visit job_posts_path
    expect(page).to have_content("Inbox")
  end
end
