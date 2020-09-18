# frozen_string_literal: true

require 'fileutils'

RSpec.describe 'ImageDownloadService' do
  subject(:image_download_service) do
    ImageDownloadService.new(
      path_image_urls: path_image_urls,
      path_downloads: path_downloads
    )
  end

  let(:path_image_urls) { 'spec/fixtures/image_urls.txt' }
  let(:path_downloads) { 'spec/fixtures/downloads' }

  describe '.call' do
    subject { image_download_service.call }

    context 'when image urls are invalid' do
      let(:path_image_urls) { 'spec/fixtures/image_urls_invalid.txt' }

      it 'raises an OpenURI::HTTPError' do
        expect { subject }.to raise_error(OpenURI::HTTPError)
      end
    end

    # Should mock OpenURI.open since tests should not depend on connection to internet.
    context 'when image urls are valid' do
      let(:path_image_urls) { 'spec/fixtures/image_urls_valid.txt' }

      it 'downloads image from the url in the image urls file' do
        subject
        url = File.read(path_image_urls).split("\n").last
        file_name = url.split('/').last
        expect(File.exist?("#{path_downloads}/#{file_name}")).to be_truthy

        FileUtils.rm_rf(path_downloads)
      end
    end
  end
end
