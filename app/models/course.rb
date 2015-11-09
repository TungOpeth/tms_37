class Course < ActiveRecord::Base
  has_many :user_courses, dependent: :destroy
  has_many :users, through: :user_courses
  has_many :course_subjects, dependent: :destroy
  has_many :users, through: :user_courses, dependent: :destroy
  has_many :subjects, through: :course_subjects, dependent: :destroy
  has_many :tasks, through: :subjects
  scope :recent, ->{order created_at: :desc}

  validates :name, presence: true
  validates :instruction, presence: true, length: { maximum: 400 }
  accepts_nested_attributes_for :course_subjects

  after_update {
    self.course_subjects.each do |course_subject|
      course_subject.create_user_subjects
    end
  }



  STATUS = [NOT_STARTED = "Not Started", STARTED = "Started", FINISHED = "Finished"]


  def date_duration
    self.subjects.inject(0){|total_date, subject| total_date + subject.date_duration}
  end

  def has_trainee? user
    self.users.include? user
  end

  def has_member? user
    has_trainee?(user) || has_supervisor?(user)
  end

  def expired_date
    self.created_at + date_duration.day
  end
end
