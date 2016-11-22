json.extract! employee, :id, :firstname, :middlename, :lastname, :date_of_birth, :password_digest, :created_at, :updated_at
json.url employee_url(employee, format: :json)