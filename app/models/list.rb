class List < ApplicationRecord
  validates :title, :presence => true, :uniqueness => true
  belongs_to :user
  has_and_belongs_to_many :books
end
