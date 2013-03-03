# == Schema Information
#
# Table name: notes
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  event_id    :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Note < ActiveRecord::Base
  attr_accessible :description, :name, :event_id
  validates :name, :description, :presence => true

	belongs_to :event
	belongs_to :user

	make_voteable
end
