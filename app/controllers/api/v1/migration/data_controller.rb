class Api::V1::Migration::DataController < ApplicationController
  def index
    render json: StateMigrationData.all,
      each_serializer: StateMigrationDataSerializer
  end
end
