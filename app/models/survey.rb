class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :questions, :dependent => :destroy
  attr_accessible :description, :style, :tilte
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true
end
