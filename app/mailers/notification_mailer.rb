# frozen_string_literal: true
class NotificationMailer < ApplicationMailer
  def create_post(user, post)
    return unless user
    return unless user.is_a? User
    return unless post
    return unless post.is_a? Post

    mail to: user.email, subject: "[#{post.title}] 포스를 생성했습니다."
  end
end
