class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  #after_create :send_welcome_email
  after_create :subscribe_to_newsletter


  private

  # def send_welcome_email
  #   UserMailer.welcome(self).deliver_now
  # end

  def subscribe_to_newsletter
    SubscribeToNewsletterService.new(self).call
  end
end
