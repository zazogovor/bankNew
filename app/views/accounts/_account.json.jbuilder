json.extract! account, :id, :account_type, :balance, :customer_id, :created_at, :updated_at
json.url account_url(account, format: :json)