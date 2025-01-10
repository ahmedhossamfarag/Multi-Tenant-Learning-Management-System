json.extract! course_content, :id, :course_id, :title, :description, :created_at, :updated_at
json.url course_content_url(course_content, format: :json)
