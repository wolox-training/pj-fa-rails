class RentPolicy < ApplicationPolicy
  def create?
    record.present?
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
