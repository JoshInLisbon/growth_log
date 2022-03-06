class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :project_users
  has_many :projects, through: :project_users
  has_many :logs

  validates :username, presence: true
  validates :email, presence: true

  extend FriendlyId
  friendly_id :username, use: :slugged

  def slug_candidates
    [
      :username,
      [:username, DateTime.now.to_date]
    ]
  end
end
