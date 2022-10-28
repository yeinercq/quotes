# == Schema Information
#
# Table name: quotes
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint           not null
#
class Quote < ApplicationRecord
  belongs_to :company

  has_many :line_item_dates, dependent: :destroy

  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }
  #
  ## this is the same -> after_create_commit -> { broadcast_prepend_to "quotes" }
  # after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self }, target: "quotes" }
  # after_update_commit -> { broadcast_replace_to "quotes" }
  # after_destroy_commit -> { broadcast_remove_to "quotes" }

  ## this is for asynchronous job
  # after_create_commit -> { broadcast_prepend_later_to "quotes" }
  # after_update_commit -> { broadcast_replace_later_to "quotes" }
  # after_destroy_commit -> { broadcast_remove_to "quotes" }
  # Those three callbacks are equivalent to the following single line
  broadcasts_to ->(quote) { [quote.company, "quotes"] }, inserts_by: :prepend
end
