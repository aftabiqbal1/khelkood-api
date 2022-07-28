class Team < ApplicationRecord
  has_many :users
  has_many :team_a_matches, class_name: 'Matches', foreign_key: 'team_a_id'
  has_many :team_b_matches, class_name: 'Matches', foreign_key: 'team_b_id'

  #in order to pass variable in params without having database model entry
  attr_accessor :result
end
