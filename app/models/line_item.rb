# == Schema Information
#
# Table name: line_items
#
#  id                :bigint           not null, primary key
#  line_item_date_id :bigint           not null
#  name              :string           not null
#  description       :text
#  quantity          :integer          not null
#  unit_price        :decimal(10, 2)   not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class LineItem < ApplicationRecord
  belongs_to :line_item_date

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :unit_price, presence: true, numericality: { greater_than: 0 }

  delegate :quote, to: :line_item_date
end
