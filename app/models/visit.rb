# frozen_string_literal: true

class Visit < ApplicationRecord
  validates :entry_date, presence: true
  validate :exit_date_after_entry_date

  belongs_to :visitor

  private

  def exit_date_after_entry_date
    return if exit_date.blank? || entry_date.blank?

    return unless exit_date < entry_date

    errors.add(:exit_date, 'must be after the entry date')
  end
end
