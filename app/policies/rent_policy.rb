class RentPolicy < ApplicationPolicy
  def create?
    user.present? && user == record.user
  end

  def index?
    record.present?
  end

  class Scope < Scope
    def resolve
      if user
        scope.where(user: user)
      else
        false
      end
    end
  end
end
