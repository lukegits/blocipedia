class Wiki < ActiveRecord::Base

  belongs_to :user, optional: true
  has_many :collaborators
  has_many :users, through: :collaborators


end
