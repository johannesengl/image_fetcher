# frozen_string_literal: true

require 'open-uri'

class ImageDownloadService
  def initialize(path_image_urls:, path_downloads:)
    @path_image_urls = path_image_urls
    @path_downloads = path_downloads
  end

  def call
    image_urls.each { |url| download_image(url: url) }
  end

  private

  attr_accessor :path_image_urls, :path_downloads

  def image_urls
    urls = File.read(path_image_urls).split("\n")
    p "Found #{urls.count} urls in input file."
    urls
  end

  def download_image(url:)
    p "Downloading #{url}"
    file_name = url.split('/').last
    url = URI(url)
    raise Error, 'url was invalid' unless url.respond_to?(:open)

    # Store files in different folders incase some images have same name.
    FileUtils.mkdir_p "#{path_downloads}/#{url.hash}"
    FileUtils.mv open(url), "#{path_downloads}/#{url.hash}/#{file_name}"
  end
end
