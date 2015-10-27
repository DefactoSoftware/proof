class Evidence < ActiveRecord::Base
  belongs_to :user
  belongs_to :requirement
end
