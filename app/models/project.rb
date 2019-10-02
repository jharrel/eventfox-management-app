class Project < ApplicationRecord
  validates :name, presence: true

  has_many :tasks
  has_many :users, through: :tasks

  def self.search(search)
    if search
      where(["name LIKE ?", "%#{search}%"])
    else
      all
    end
  end
end
