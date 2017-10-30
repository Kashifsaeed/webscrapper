require 'rubygems'
require 'nokogiri'
require 'open-uri'

module Scrapping
  class Parser
    attr_accessor :url,:parsed_data,:error,:message,:doc
    def self.parse_doc(url)
      begin
        doc = Nokogiri::HTML(open(url))
        response = {error: false,doc: doc} 
      rescue Exception => e
        response = {error: true, message: e.message}
      end
      response
    end
    
    def initialize url
      @url = url
      @parsed_data = Parser.parse_doc(url)
      @error = @parsed_data[:error]
      @message = @parsed_data[:message]
      @doc = @parsed_data[:doc]
    end

    def content_by_tag(doc,tag_name)
      tags_data = []
      doc.css(tag_name).each do |item|
        text = tag_name == 'a' ? item.attr('href') : item.text
        tags_data << {name: tag_name,content: text}
      end
      tags_data
    end

    def content_by_class(doc,class_name)
      tags_data = []
      doc.css(".#{class_name}").each do |item|
        text = item.text
        tags_data << {name: tag_name,content: text}
      end
      tags_data
    end

  end
end