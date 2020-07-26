class Blog < ApplicationRecord
  has_many :entries, dependent: :destroy
  validates :title, presence: true
  validates :title, uniqueness: true
  scope :title_search, -> (title) { where('title like :title', title: "%#{title}%") }

  # return by "all"
  scope :notfound_scope, -> { where(title: "100000").first }

  # return by nil
  def self.notfound_method
    where(title: "100000").first
  end
end
