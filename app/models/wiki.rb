class Wiki < ActiveRecord::Base
  validates :title, presence: true
 before_validation private: false
  belongs_to :user, optional: true
  has_many :collaborators
  has_many :users, through: :collaborators

  scope :visible_to, -> (user) do
    return all if user.premium? || user.admin?
    where(private: [false, nil])
  end
end
