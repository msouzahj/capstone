class Access < ActiveRecord::Base
  belongs_to :meets
  belongs_to :seasons
  belongs_to :events
end
