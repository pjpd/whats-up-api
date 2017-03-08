class Collection < ApplicationRecord
  # model association
  has_many :webpages, dependent: :destroy

  #validations
  validates_presence_of :title
end
