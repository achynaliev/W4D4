# == Schema Information
#
# Table name: tracks
#
#  id       :integer          not null, primary key
#  title    :string
#  ord      :integer
#  lyrics   :text
#  bonus    :boolean          default(FALSE)
#  album_id :integer
#

class Track < ApplicationRecord

  validates :title, presence: true
  validates :album_id, presence: true

  belongs_to :album,
   foreign_key: :album_id,
   class_name: :Album

end
