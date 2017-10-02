class Topic < ActiveRecord::Base
  validates :link, presence: true
  acts_as_votable
has_many :comments
end
