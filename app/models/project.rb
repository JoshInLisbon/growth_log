class Project < ApplicationRecord
  extend FriendlyId

  has_many :project_users, dependent: :destroy
  has_many :users, through: :project_users
  has_many :logs

  friendly_id :name, use: :slugged

  def slug_candidates
    [
      :name,
      [:name, users.first.username]
    ]
  end

  validates :name, presence: true
  validates :description, presence: true

  before_validation :format_url
  validates_format_of :url, :with => URI::regexp(%w(http https)), allow_blank: true
  def format_url
    self.url = nil if self.url == ""
    if self.url
      self.url = "http://#{self.url}" unless self.url[/^https?/]
    end
  end

end
