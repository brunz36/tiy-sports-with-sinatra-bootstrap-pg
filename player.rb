class Player < ActiveRecord::Base
  has_many :teams
  has_many :teams, through: :memberships
end
