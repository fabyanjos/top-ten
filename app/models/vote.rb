class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey
  has_many :orders, :dependent => :destroy
  attr_accessible :survey_id, :user_id
  accepts_nested_attributes_for :orders, :reject_if => lambda { |a| a[:value].nil? or a[:value] < 0}, :allow_destroy => true
end
