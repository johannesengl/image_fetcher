# Image Fetcher

This app is a command line app. It takes as an input a path to a plain text file containing urls to images and a path to a destination foloder for storing the downloaded images.

## Usage

Command Help:
`bundle exec bin/image-fetcher -h`

Command Fetch:
`bundle exec bin/image-fetcher fetch`

COMMAND OPTIONS
--path_downloads=arg  - Path to save downloaded images (default: tmp/downloads)
--path_image_urls=arg - Path to plain text file containing image urls (default: tmp/image_urls.txt)
