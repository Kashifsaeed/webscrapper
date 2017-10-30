class Api::V1::PagesController < Api::V1::BaseController
  before_action :find_page
  
  def index
  end

  def create
    response = @page.parse_url
    render json: response
  end

  def list
    @tags = Tag.grouped_by_name(@page)
    render json: {url: @page.url,tags: @tags}
  end


  private
    def find_page
      @page = Page.find_or_create_by(url: @page_url)
    end
end