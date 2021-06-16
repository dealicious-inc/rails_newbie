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
require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#validation' do
    it { should validate_presence_of(:title) }
    it do
      should validate_length_of(:title)
               .is_at_least(10)
               .on(:create)
    end
    it { should validate_presence_of(:body) }
  end

  describe '#association' do
    it { should belong_to(:user) }
  end

  describe "#callback" do
    it "포스트가 생성되었을 때 생성자에게 알림을 보내야 합니다" do
      u = create :user
      p = u.posts.build(title: Faker::Lorem.characters(number: 30), body: Faker::Lorem.paragraph)
      expect(NotificationMailer).to receive(:create_post)
      p.save
    end
  end
end
