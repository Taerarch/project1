class Book < ApplicationRecord
  validates :title, :presence => true, :uniqueness => true
  belongs_to :author, :optional => true
  has_and_belongs_to_many :lists, :optional => true
end
