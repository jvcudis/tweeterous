class Tweet < ActiveRecord::Base
  validates :content, presence: true,
                      :length => { :maximum => 100 }
  validates :user_id, presence: true

  belongs_to :user
end
