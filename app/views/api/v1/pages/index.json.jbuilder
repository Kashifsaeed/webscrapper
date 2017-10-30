json.id @page.id
json.url @page.url
@tags.each do |k, v|
    json.set! k do
      json.array!(v)do |tag|
        json.id tag.id
        json.content tag.content
      end
    end
  end