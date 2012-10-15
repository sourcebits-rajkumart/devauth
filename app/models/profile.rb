class Profile < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  def index
  	@user=User.find_by
  end

end
