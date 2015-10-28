class Course < ActiveRecord::Base

  has_many :user_courses, dependent: :destroy
  has_many :course_subjects, dependent: :destroy
  has_many :users, through: :user_courses, dependent: :destroy
  has_many :subjects, through: :course_subjects, dependent: :destroy
  has_many :tasks, through: :subjects
  scope :recent, ->{order created_at: :desc}

  validates :name, presence: true

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
