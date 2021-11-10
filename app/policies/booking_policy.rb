class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  # def update?
  #   admin_or_owner?
  # end

  # def destroy?
  #   admin_or_owner?
  # end

  # private

  # def admin_or_owner?
  #   owner? || admin?
  # end

  # def admin?
  #   user.admin
  # end

  # def owner?
  #   record.user == user
  # end
end
