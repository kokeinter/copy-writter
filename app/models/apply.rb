class Apply < ApplicationRecord
  belongs_to :user
  belongs_to :recruit
  validates :user_id, presence: true
  validates :recruit_id, presence: true
end
