class TicketPolicy < ApplicationPolicy
  attr_reader :user, :ticket

  def initialize(user, ticket)
    @user = user
    @ticket = ticket
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    true if user
  end

  def create?
    true if user
  end

  def edit?
    true if user && user == ticket.user
  end

  def update?
    edit?
  end

  def destroy?
    true if user && user == ticket.user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
