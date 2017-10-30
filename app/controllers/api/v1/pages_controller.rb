class Api::V1::PagesController < Api::V1::BaseApiController
  before_action :find_page
  
  ###################################
  ## url: /api/v1/pages
  ## method: GET
  ## @params: URL in headers
  ## find page by url
  ## list all the tags of that page.
  ####################################
  def index
    @tags = Tag.grouped_by_name(@page)
  end

  ###################################
  ## url: /api/v1/pages
  ## method: POST
  ## @params: URL in headers
  ## find or create page by url
  ## read the page from url
  ## parse header and links
  ## store in database
  ####################################
  def create
    response = @page.parse_url
    render json: response
  end


  private
    def find_page
      @page = Page.find_or_create_by(url: @page_url)
    end
end