class Team < ActiveRecord::Base
  has_many :players
  has_many :players, through: :memberships
end
