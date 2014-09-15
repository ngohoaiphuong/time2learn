class Result < ActiveRecord::Base
  belongs_to :user
  belongs_to :test
  attr_accessible :answer
end
