class Event < ActiveRecord::Base
  belongs_to :meet
  has_many :accesses
  validates :name, presence: :true
  validates :results, presence: :true
end
