class RentPolicy < ApplicationPolicy
  def create?
    user.present? && user == record.user
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
