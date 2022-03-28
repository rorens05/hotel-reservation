json.extract! membership_withdrawal, :id, :user_id, :content, :admin_note, :status, :created_at, :updated_at
json.url membership_withdrawal_url(membership_withdrawal, format: :json)
