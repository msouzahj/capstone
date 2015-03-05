class Season < ActiveRecord::Base
	belongs_to :user
	has_many :meets, dependent: :destroy
        accepts_nested_attributes_for :meets
	validates :season, presence: true
	validates :year, presence: true
	has_many :accesses
end
