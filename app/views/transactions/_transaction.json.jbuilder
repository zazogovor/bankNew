json.extract! transaction, :id, :account_id, :transferee_id, :amount, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)