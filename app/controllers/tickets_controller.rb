class TicketsController < ApplicationController
	before_action :authenticate_user!

	def assign_roles
		@users = User.where.not(id: current_user.id)
	end

	def update_role
		user = User.find(params[:user][:id])

		if user.present?
			user.update(role: params[:role])
      redirect_to assign_roles_path, notice: "Role updated"
    else
      render :assign_roles, status: :unprocessable_entity
    end
	end
end
