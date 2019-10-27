class RentPolicy < ApplicationPolicy
  def create?
    user.present? && user == record.user
  end

  def index?
    record.present?
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
