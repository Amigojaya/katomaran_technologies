class UserPolicy < ApplicationPolicy
  def assign_roles?
    user.super_admin?
  end

  def update_role?
    user.super_admin?
  end

  def users_list_for_admins?
    user.admin?
  end

  def block_user?
    user.admin?
  end

  def index?
  	user.user? && !user.is_blocked
  end

  def new?
  	user.user? && !user.is_blocked
  end

  def edit?
  	user.admin?
  end

  def update?
  	user.admin?
  end

  def create?
  	user.user?
  end

  def all_bookings?
  	user.admin?
  end
end