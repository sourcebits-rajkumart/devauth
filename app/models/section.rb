class Section < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :content
  belongs_to :user
  belongs_to :story
end
