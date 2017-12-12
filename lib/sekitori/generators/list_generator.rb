require 'uri'
require 'open-uri'
require 'fileutils'
require 'tmpdir'
require 'nokogiri'
require 'active_support/all'

module Sekitori::Generators
  class ListGenerator
    CACHE_DIR=File.join(Dir.tmpdir, "sekitori_checker")
  
    TARGET_XPATH_LIST=[]
    IGNORE_XPATH_LIST=[]
  
    def execute
      return @list if @list.present?
      url = self.class::URL
      target_xpaths = self.class::TARGET_XPATH_LIST
      ignore_xpath = self.class::IGNORE_XPATH_LIST
  
      html = ListGenerator.get url
      list = ListGenerator.parse html, url, target_xpaths
      ignore_list = ListGenerator.parse html, url, ignore_xpath
      @list = list - ignore_list
      @list
    end
  
    def list
      execute
    end
  
    def to_h
      { self.class::BANZUKE => execute }
    end
  
    def self.get url
      file_name = url.split('/').last
      path = File.join(CACHE_DIR, file_name)
      cache = get_from_file(path)
      return cache if cache
  
      puts "Creating cache for #{file_name}"
      html = get_from_http(url)
      FileUtils.mkdir_p CACHE_DIR
      open(path, "w") {|file| file.write html }
      html
    end
  
    def self.get_from_file path
      if File.exist? path
        File.read path
      else
        nil
      end
    end
  
    def self.get_from_http url
      encode_url = URI.escape(url)
      html = open(encode_url).read
    end
  
    def self.parse html, url, xpath_list
      document = Nokogiri::HTML(html, url)
      xpath_list.flat_map{|xpath| document.xpath(xpath).map(&:text)}
    end
  
    def self.clean path=CACHE_DIR
      FileUtils.rm_rf(path, secure: true)
    end
  end
end
