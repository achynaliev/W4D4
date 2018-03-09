# == Schema Information
#
# Table name: albums
#
#  id      :integer          not null, primary key
#  title   :string           not null
#  year    :integer          not null
#  studio  :boolean          default(TRUE), not null
#  band_id :integer
#

class Album < ApplicationRecord

  validates :title, presence: true
  validates :title, presence: true
  validates :year, presence: true
  validates :band_id, presence: true

  belongs_to :band,
    foreign_key: :band_id,
    class_name: :Band

  has_many :tracks,
    foreign_key: :album_id,
    class_name: :Track

end
