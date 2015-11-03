class UserTask < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
  belongs_to :course_subject
  belongs_to :user_subject
  DEACTIVATED = "Deactivated"
  ACTIVATE = "Activate"
end
