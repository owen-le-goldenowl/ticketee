class Comment < ApplicationRecord
  validates_presence_of :text
  belongs_to :user
  belongs_to :ticket
  # attr_accessor :text
end
