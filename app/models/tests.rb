class Tests < ActiveRecord::Base
  attr_accessible :description, :name, :questions

  serialize :questions, JSON
end
