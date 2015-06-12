json.array!(@image_uploads) do |image_upload|
  json.extract! image_upload, :id, :filename, :user_id, :timestamp
  json.url image_upload_url(image_upload, format: :json)
end
