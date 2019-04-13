class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :artist_name, presence: true
  validate :missing_release_year
  # validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }

  def missing_release_year
    if released.present? && release_year.nil?
      errors.add(:release_year, "cannot be blank.")
    elsif released.present? && release_year > Date.today.year
      errors.add(:release_year, "must not be in the future.")
    end
  end

end
