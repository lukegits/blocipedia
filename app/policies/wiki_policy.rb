class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

  def update?
  user.present?
  end

  def new?
      user.present?
    end

    def create?
      user.present?
    end

    def show?
      user.present?
    end

    def edit?
      user.present?
    end

  end
