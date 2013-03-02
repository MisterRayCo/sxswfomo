# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  photo           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :photo, :password, :password_confirmation
  validates :name, :email, :presence => true

	has_many :notes
	has_secure_password

  def slug
    instance = self.name.strip

    # Via: http://stackoverflow.com/questions/1302022/best-way-to-generate-slugs-human-readable-ids-in-rails
    instance.downcase!

    instance.gsub!(/['`]/,"")

    # @ --> at, and & --> and
    instance.gsub!(/\s*@\s*/, " at ")
    instance.gsub!(/\s*&\s*/, " and ")

    #replace all non alphanumeric, underscore or periods with underscore
    instance.gsub!(/\s*[^A-Za-z0-9\.\-]\s*/, '_'  )

    #convert double underscores to single
    instance.gsub!(/_+/,"_")

    #strip off leading/trailing underscore
    instance.gsub!(/\A[_\.]+|[_\.]+\z/,"")

    instance
  end
end
