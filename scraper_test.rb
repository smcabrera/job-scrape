require 'minitest/autorun'
require 'mechanize'
require_relative 'scraper'

class ScraperTest < MiniTest::Unit::TestCase
  def test_fix_title
    scraper = Scraper.new
    assert_equal ["Full-stack Rails Developer", "Camfil APC"], scraper.fix_title("Job: Full-stack Rails Developer - Camfil APC")
  end

  def test_construct_job
    scraper = Scraper.new

    scraper.construct_job()
  end

  def clean_job_data

  end
end
