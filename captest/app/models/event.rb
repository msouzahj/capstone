class Event < ActiveRecord::Base
  belongs_to :meet
  has_many :accesses
end
