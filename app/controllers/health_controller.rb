class HealthController < ApplicationController
  def liveness
    render json: { status: "ok" }
  end

  def readiness
    begin
      ActiveRecord::Base.connection.execute("SELECT 1")
      render json: { status: "ok" }
    rescue StandardError
      render json: { status: "error" }, status: :service_unavailable
    end
  end
end
