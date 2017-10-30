require 'scrapping/parser'
class Page < ApplicationRecord
  validates :url, :presence => true, :uniqueness => true
  
  has_many :tags,dependent: :destroy

  def parse_url
    tags = []
    parser = Scrapping::Parser.new(url)
    unless parser.error
      # parse h1 from doc
      tags << parser.content_by_tag(parser.doc,'h1')

      # parse h2 from doc
      tags << parser.content_by_tag(parser.doc,'h2')

      # parse h3 from doc
      tags << parser.content_by_tag(parser.doc,'h3')

      # parase url of links from doc
      tags << parser.content_by_tag(parser.doc,'a')

      # create tags
      self.tags << Tag.create(tags.flatten)
      response = {error: false,message: "Page content is parsed.",status: 200}
    else
      response = {error: true,message: parser.message,status: 400}
    end
  end
end
