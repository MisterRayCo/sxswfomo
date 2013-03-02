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

require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
