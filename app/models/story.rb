class Story < ActiveRecord::Base
  attr_accessible :name
  belongs_to :user
  has_many :sections
  validates :name , :uniqueness=>true
end
