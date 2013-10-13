class Question < ActiveRecord::Base
  belongs_to :survey
  attr_accessible :help, :title, :survey_id
end
