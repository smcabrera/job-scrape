class JobPostsController < ApplicationController
  def fetch
    scraper = Application::Helper::Scraper.new
    scraper.fetch_jobs
  end

  def index
    @job_posts = JobPost.all
  end

  def show
    @job_post = JobPost.find(params[:id])
  end
end
