class Dataset < ActiveRecord::Base
  belongs_to :account
  attr_accessible :format, :name, :output, :public
  
  validates_presence_of :format, :name, :output
end
