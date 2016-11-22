json.extract! card, :id, :firstname, :middlename, :lastname, :due_date, :security_number, :account_id, :created_at, :updated_at
json.url card_url(card, format: :json)