class CourseSubject < ActiveRecord::Base
  belongs_to :course
  belongs_to :subject
  has_many :user_subjects
  has_many :user_tasks
  accepts_nested_attributes_for :user_subjects

  def create_user_subjects
    course_subjects = course.course_subjects
      course.users.each do |user|
        course_subjects.each do |course_subject|
        user_subject = UserSubject.create(user_id: user.id, course_subject_id: course_subject.id)
        if user_subject.save
        else
        end
      end
    end
  end
end
