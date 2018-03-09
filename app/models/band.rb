# == Schema Information
#
# Table name: bands
#
#  id   :integer          not null, primary key
#  name :string           not null
#

class Band < ApplicationRecord

  validates :name, presence: true

  has_many :albums,
    foreign_key: :album_id,
    class_name: :Album

end
