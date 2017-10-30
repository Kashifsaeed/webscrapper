require "spec_helper"  
describe Api::V1::PagesController , :type => :api do  
  
  # success expected scenario
  context :success_create do
    before do 
      header "URL", "https://www.lipsum.com/"
      post "/api/v1/pages"
    end
    
    it 'responds with a 200 status' do
      expect(last_response.status).to eq 200
    end
    
    it 'responds with success message' do
      message = json["message"]
      expect(message).to eq("Page content is parsed.")
    end
  end

  # fail expected scenario
  context :failure_create do
    before do 
      post "/api/v1/pages"
    end
    
    it 'responds with no url passed error' do
      message = json["message"]
      expect(message).to eq("No page url found.")
    end
  end

  # success page's tags list
  context :index do
    before do
      header "URL", "https://www.lipsum.com/"
      get "/api/v1/pages",nil, {'HTTP_ACCEPT' => "application/json"}
      @page = Page.last!
    end
    
    it 'responds with status 200' do
      expect(last_response.status).to eq 200
    end

    it 'responds with expected url in json' do
      url = json["url"]
      expect(@page.url).to eq url
    end
  end
end  