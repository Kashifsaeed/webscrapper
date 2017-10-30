class Api::V1::BaseController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :parse_request
  before_action :check_url

  private
    def parse_request
      begin
        @page_url = request.headers['URL']
      rescue Exception => e
        render json: {status: 400,message: 'No page url passed.' }
      end
    end

    def check_url
      unless @page_url
        render json: {status: 400,message: 'No page url found.'}
      end
    end
end