class ProjectsController < ApplicationController
  def create
    Project.transaction(requires_new: true) do
      project = Project.create!(project_params)
      ProjectUser.create!(project: project, user: current_user)
    rescue StandardError => e
      flash[:error] = "Your project could not be saved"
      raise ActiveRecord::Rollback
    end

    redirect_to user_path(current_user)
  end

  def show
    id = params.permit(:id)[:id]
    @project = Project.includes(:logs).where(slug: params[:id]).first
  end

  def destroy
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :url)
  end
end
