json.array!(@startups) do |startup|
  json.extract! startup, :name, :link, :about, :founderinfo, :entrepreneur_id
  json.url startup_url(startup, format: :json)
end
