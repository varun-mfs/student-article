class Article < ApplicationRecord
  belongs_to :student
  has_many :comments, dependent: :destroy
end
