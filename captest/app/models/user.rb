class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :seasons
  has_many :timers
  has_many :notes
  validates :fname, presence: true
  validates :lname, presence: true

  
end
