class Quiz < ApplicationRecord
  belongs_to :user
  has_many :questions
  has_many :answers

  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true
end
