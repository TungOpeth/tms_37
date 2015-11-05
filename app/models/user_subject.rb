class UserSubject < ActiveRecord::Base
  belongs_to :user
  belongs_to :course_subject
  has_many :user_tasks
  accepts_nested_attributes_for :user_tasks
end
