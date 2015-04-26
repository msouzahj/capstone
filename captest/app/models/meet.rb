class Meet < ActiveRecord::Base
  belongs_to :season
  has_many :events, dependent: :destroy
  has_many :accesses
  validates :name, presence: true
  validates :date, presence: true
  
end
