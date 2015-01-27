module ApplicationHelper
  class Scraper
    require 'time'
    require 'date'
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
      new_job = JobPost.new(title: job_data[:title], company: job_data[:company], url: job_url, date_posted: job_data[:date_posted])
      if JobPost.find_by_url(job_url)
        puts "Job already in the database"
      else
        new_job.save
      end
    end

    def fix_date(date_string)
      year_string = Time.now.year.to_s
      month_dict = {"Jan" => '01', "Feb" => "02", "Mar" => "03", "Apr" => "04", "May" => "05", "Jun" => "06", "Jul" => "07", "Aug" => "08", "Sep" => "09", "Oct" => "10", "Nov" => "11", "Dec" => "12"}
      month_string = date_string[0..2]
      month_number_string = month_dict[month_string]
      day_string = date_string[4..date_string.length]
      puts "#{year_string}-#{month_number_string}-#{day_string}"
      return Date.new(year_string, month_number_string, day_string)
    end

    def fetch_jobs
      job_list = []
      job_link_list = self.get_job_links_list
      job_link_list.each do |job_link|
        job_list << self.construct_job(job_link)
      end
      job_list
    end
  end
end
