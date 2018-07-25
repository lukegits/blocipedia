class Charge < ActiveRecord::Base

  belongs_to :users

  after_create :upgrade_user_role


  def upgrade_user_role
    current_user.role == 'premium'
  end

end
