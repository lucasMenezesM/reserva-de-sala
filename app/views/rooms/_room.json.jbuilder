json.extract! room, :id, :name, :block_id, :floor_id, :capacity, :created_at, :updated_at
json.url room_url(room, format: :json)
