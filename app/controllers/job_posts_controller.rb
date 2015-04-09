class JobPostsController < ApplicationController

  def scrape
    scraper = Scraper.new("https://weworkremotely.com/categories/2/jobs", /^.jobs.\d*$/)

    if scraper.fetch_jobs()
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
    # TODO: this shouldn't exist...you want a view with a scope defined not another controller action
    @job_posts = JobPost.only_deleted
  end

  def show
    @job_post = JobPost.find(params[:id])
  end

  def restore
    @job_post = JobPost.with_deleted.find(params[:id])

    if @job_post.restore
      flash[:notice] = "Job post was restored. Check your inbox. It should be back."
    else
      flash[:error] = "There was a problem restoring this job post. Please try again."
    end
    #@job_post = params[:id] # todo: What the hell is this doing here?

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @job_post = JobPost.find(params[:id])

    if @job_post.destroy
      flash[:notice] = "Job post was archived. Check in the archive to restore the post"
    else
      flash[:error] = "There was a problem deleting this job post. Please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end
end
