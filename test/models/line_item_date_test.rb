# == Schema Information
#
# Table name: line_item_dates
#
#  id         :bigint           not null, primary key
#  quote_id   :bigint           not null
#  date       :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class LineItemDateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
