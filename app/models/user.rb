class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  validate :validate_name

  validates :role, presence: true

  enum :role, [ :student, :instructor, :admin ], validate: true

  def validate_name
    errors.add(:name, "does not match Regex") unless name.strip =~ /\A([a-z]{3,})(\s+[a-z]{3,})*\Z/i
  end

  has_many :courses, foreign_key: :instructor_id
  has_many :enrollments, foreign_key: :student_id
  has_many :payments
end
