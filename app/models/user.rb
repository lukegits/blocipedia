class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis

  before_save { self.email = email.downcase }
   after_initialize { self.role ||= :standard }

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  enum role: [:standard, :admin, :premium]

  private

  def send_user_emails
    UserMailer.new_user(self).deliver_now
  end
end
