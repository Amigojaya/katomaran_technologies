class UserManagmentController < ApplicationController
	before_action :authenticate_user!

	def assign_roles
		authorize current_user, policy_class: UsersPolicy

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

	def users_list_for_admins
		@users = User.where(role: 'user')
	end

	def block_user
		user = User.find(params[:user][:id])

		if user.present?
			user.update(is_blocked: params[:user][:is_blocked])
      redirect_to users_list_for_admins_path, notice: "User (#{user.email}) Stats updated"
    else
      render :assign_roles, status: :unprocessable_entity
    end
	end
end
