# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  url        :string(255)
#  speakers   :string(255)
#  date       :datetime
#  address    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Event < ActiveRecord::Base
  attr_accessible :address, :date, :name, :speakers, :url
	has_many :notes
end
