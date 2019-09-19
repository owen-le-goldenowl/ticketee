class Admin::UserPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, _record)
    @user = user
    @_record = _record
  end

  def index?
    user.admin?
  end

  def new?
    user.admin?
  end

  def create?
    user.admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
