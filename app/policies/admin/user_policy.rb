class Admin::UserPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, _record)
    @user = user

  end

  def index?
    user.admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
