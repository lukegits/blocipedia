class Wiki < ActiveRecord::Base
after_initialize :initialize_role

   private
   def initialize_role
     self.private = false if self.private.nil?
   end

  validates :title, presence: true
  belongs_to :user, optional: true
  has_many :collaborators
  has_many :users, through: :collaborators

  scope :visible_to, -> (user) do
    return all if user.premium? || user.admin?
    where(private: [false, nil])
  end
end
