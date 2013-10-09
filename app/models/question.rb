class Question < ActiveRecord::Base
  belongs_to :survey
  attr_accessible :help, :tilte, :survey_id
end
