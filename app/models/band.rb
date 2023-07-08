# == Schema Information
#
# Table name: bands
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string           not null
#
class Band < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    
    has_many :albums,
        dependent: :destroy

    has_many :tracks,
        through: :albums,
        source: :tracks
end
