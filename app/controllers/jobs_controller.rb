class JobsController < ApplicationController

    include Authenticable

  def index
    render json: Job.all
  end

  def create
    job = current_user.jobs.build(job_params)
    if job.save
      render json: job, status: :created
    else
      render json: { errors: job.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :note, :taken, :user_complete, :rider_complete, :rider_id, :latitude, :longitude, :rider_lat, :rider_long, :rider_name)
  end
  
end
