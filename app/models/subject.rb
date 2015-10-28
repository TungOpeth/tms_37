class Subject < ActiveRecord::Base
  has_many :user_subjects
  has_many :course_subjects
  has_many :tasks, dependent: :destroy
  scope :recent, ->{order created_at: :desc}

  accepts_nested_attributes_for :tasks, allow_destroy: true,
    reject_if: proc {|attribute| attribute[:name].blank?}
  validates :name, presence: true
end
