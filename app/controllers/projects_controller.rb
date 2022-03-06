class ProjectsController < ApplicationController
  def create
    begin
      ActiveRecord::Base.transaction(requires_new: true) do
        if project = Project.create(project_params)
          if ProjectUser.create(project: project, user: current_user)
            redirect_to user_path(current_user)
          else
            raise ActiveRecord::Rollback
          end
        else
          raise ActiveRecord::Rollback
        end
      end
    rescue
      flash[:notice] = "Your project could not be saved"
      redirect_to user_path(current_user)
    end
  end

  def show
  end

  def destroy
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :url)
  end
end
