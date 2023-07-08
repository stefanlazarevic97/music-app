# == Schema Information
#
# Table name: tracks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  album_id   :bigint           not null
#  ord        :integer          not null
#  bonus      :boolean          default(FALSE), not null
#  lyrics     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Track < ApplicationRecord
    validates :title, :ord, presence: true
    validates :bonus, inclusion: {in: [true, false]}
    validates :ord, uniqueness: {scope: :album_id}

    after_initialize :set_defaults

    belongs_to :album

    has_one :band,
        through: :album:
        source: :band

    def set_defaults
        self.bonus ||= false
    end
end
