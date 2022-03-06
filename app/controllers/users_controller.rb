class UsersController < ApplicationController
  def show
    @user = User.includes(:projects).where(slug: params[:id]).first
    @projects = @user.projects
    if current_user && @current_users_page = current_user == @user
      @project = Project.new
    end
  end
end