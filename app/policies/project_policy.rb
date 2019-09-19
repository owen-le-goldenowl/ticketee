class ProjectPolicy < ApplicationPolicy
  attr_reader :user, :project

  def initialize(user, project)
    @user = user
    @project = project
  end

  def index?
    true
  end

  def new?
    true if user&.admin?
  end

  def create?
    true if user&.admin?
  end

  def edit?
    true if user&.admin?
  end

  def show?
    true
  end

  def update?
    edit?
  end

  def destroy?
    true if user&.admin?
  end

  def resolve
    scope.all
  end
end
