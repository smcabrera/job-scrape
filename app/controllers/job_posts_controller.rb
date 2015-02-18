class JobPostsController < ApplicationController

  def scrape
    scraper = ApplicationHelper::Scraper.new
    if scraper.pull_jobs
      flash.now[:notice] = "Jobs successfully pulled from job sites."
      redirect_to job_posts_path
    else
      flash.now[:error] = "There was a problem scraping the job sites. Please try again."
      redirect_to job_posts_path
    end
  end

  def index
    @job_posts = JobPost.all
  end

  def archived
    @job_posts = JobPost.only_deleted
  end

  def show
    @job_post = JobPost.find(params[:id])
  end

  def restore
    #JobPost.unscoped { super }
    @job_post = JobPost.with_deleted.find(params[:id])

    if JobPost.with_deleted.find(@job_post.id).restore
      flash[:notice] = "Job post was archived. Check in the archive to restore the post"
      redirect_to job_posts_archived_path
    else
      flash[:error] = "There was a problem deleting this job post. Please try again."
      redirect_to job_posts_archived_path
    end
    @job_post = params[:id]
  end

  def destroy
    @job_post = JobPost.find(params[:id])

    if @job_post.destroy
      flash[:notice] = "Job post was archived. Check in the archive to restore the post"
      redirect_to job_posts_path
    else
      flash[:error] = "There was a problem deleting this job post. Please try again."
      redirect_to job_posts_path
    end
  end
end
