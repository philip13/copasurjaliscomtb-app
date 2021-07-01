module API
  module V1
    class RaceTimeLapses < Grape::API
      format :json
      include API::V1::Defaults
      resource :race_time_lapses do
        desc "Return all race_time_lapses"
        get "" do
          RaceTimeLapse.all
        end

        post do
          RaceTimeLapse.create!({ end_lap: params[:end_lap] })
        end
      

        desc "Return a race_time_lapses"
        params do
          requires :id, type: String, desc: "ID of the race_time_lapse"
        end
        get ":id" do
          RaceTimeLapse.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end