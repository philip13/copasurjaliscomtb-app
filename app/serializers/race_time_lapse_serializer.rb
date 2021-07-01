# race_time_lapse_serializer.rb
class RaceTimeLapseSerializer < ActiveModel::Serializer
   # id: nil, register_id: nil, rider_id: nil, start_lap: nil, end_lap: nil, created_at: nil, updated_at: nil>
   attributes :id, :register_id, :rider_id, :start_lap, :end_lap
end