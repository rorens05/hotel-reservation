json.extract! problem_form, :id, :user_id, :date_of_incident, :place, :content, :admin_note, :status, :created_at, :updated_at
json.url problem_form_url(problem_form, format: :json)
