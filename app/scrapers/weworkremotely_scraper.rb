require 'mechanize'
require 'time'
require 'date'

#todo: Change this to WeWorkRemotelyScraper when we have more scrapers for now let's just leave it since it's the only one

class Scraper
  BASE_URL = "https://weworkremotely.com"

  def get_job_links_list
    page = Mechanize.new.get("#{BASE_URL}/categories/2/jobs")
    job_links = page.links.select { |link| link.href.match(/^.jobs.\d*$/) }
    job_links
  end

  def extract_job_data(job_link)
    job_string = job_link.to_s
    job_array = job_string.split("\n")
    job_array.map! { |job| job.strip }
    job_array.delete_if { |item| item == "" }
    {:company => job_array[0], :title => job_array[1], :date_posted => job_array[2]}
  end

  def extract_job_url(job_link)
    BASE_URL + job_link.href
  end

  def construct_job(job_link)
    job_data, job_url = extract_job_data(job_link), extract_job_url(job_link)
    JobPost.new(job_data[:title], job_data[:company], job_data[:date_posted], job_url)
  end

  def fetch_jobs
    job_list = []
    job_link_list = self.get_job_links_list
    job_link_list.each do |job_link|
      job_list << construct_job(job_link)
    end
    job_list
  end
end

class JobPost
  attr_accessor :title, :company, :url

  def initialize(title, company, date_posted, url)
    @title = title
    @company = company
    @url = url
    @date_posted = date_posted
  end
end

#todo: The resulting output could still use some work to remove extraneous text and separate the job title from the company name



