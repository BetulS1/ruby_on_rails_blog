json.extract! datum, :id, :ad, :marka, :yorum, :created_at, :updated_at
json.url datum_url(datum, format: :json)
