class Group < ApplicationRecord
  has_and_belongs_to_many :user

  validates :title, presence: true,
    uniqueness: { case_sensitive: false },
    length: {minimum:3, maximum:25}

  validates :bio, presence: true,
    length: {minimum:15, maximum:100}

end
