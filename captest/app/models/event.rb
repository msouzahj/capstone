class Event < ActiveRecord::Base
  belongs_to :meet
  has_many :accesses
  validates :name, presence: :true
  validates :results, format: { with: /((NH)|(DNF))|(([0-9]|0[0-9]|1[0-9]|2[0-3]):([0-5][0-9])(\.([0-9]+))*)|([0-5]*[0-9])\.([0-9])+/, message: "NH,DNF,times and distances allowed"}
end
