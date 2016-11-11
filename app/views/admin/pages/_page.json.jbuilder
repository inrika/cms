json.extract! page, :id, :title, :url, :template, :content, :is_published, :created_at, :updated_at
json.url page_url(page, format: :json)