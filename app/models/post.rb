# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  body       :text(65535)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  # validation
  validates_presence_of :title
  validates_length_of :title, minimum: 10
  validates_presence_of :body

  # relations
  belongs_to :user

  # callbacks
  after_create :send_notification

  private

  def send_notification
    NotificationMailer.create_post(user, self)
  end
end
