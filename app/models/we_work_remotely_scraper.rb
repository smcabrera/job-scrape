class WeWorkRemotelyScraper
  require 'time'
  require 'date'
  BASE_URL = "https://weworkremotely.com"
  URL = "#{BASE_URL}/categories/2/jobs"

  def initialize(url, matcher)
    @url = url
    @matcher = matcher
  end

  def fetch_jobs
    if jobs = find_job_links(@url, @matcher)
      jobs.each do |job_link|
        attributes = parse_link(job_link)
        construct_job(attributes)
      end
    end
  end

  def find_job_links(url, matcher)
    page = Mechanize.new.get(url)
    page.links.select { |link| link.href.match(matcher) }
  end

  def construct_job(attributes)
    unless JobPost.find_by_url(attributes[:url])
      JobPost.create(attributes)
    end
  end

  def extract_job_data(job_link)
    job_array = job_link.to_s.split("\n")
    job_array.map! { |job| job.strip }
    job_array.delete_if { |item| item == "" }
    {:company => job_array[0], :title => job_array[1], :date_posted => job_array[2], :url  => (BASE_URL + job_link.href) }
  end

  def parse_link(job_link)
    job_string = job_link.to_s
    job_array = job_string.split("\n")
    job_array.map! { |job| job.strip }
    job_array.reject(&:empty?)
    url = BASE_URL + job_link.href
    { :company => job_array[0], :title => job_array[1], :date_posted => job_array[2], :url => url }
  end
end
