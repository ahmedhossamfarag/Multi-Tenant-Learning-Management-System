json.extract! activity, :id, :title, :description, :event_day, :created_at, :updated_at
json.url activity_url(activity, format: :json)
