class Comment < ApplicationRecord
  belongs_to :student
  belongs_to :article
  enum status: {
    'active': 0, 
    'delete': 1
  }
end
