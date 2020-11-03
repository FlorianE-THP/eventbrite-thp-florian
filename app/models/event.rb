class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :organizer, class_name: "User"

  validates :start_date,
            presence: true

  validates :duration,
            presence: true,
            numericality: { greater_than: 0, Integer: true }

  validates :title,
            presence: true,
            length: { minimum: 5, maximum: 140 }

  validates :description,
            presence: true,
            length: { minimum: 20, maximum: 1000 }

  validates :price,
            presence: true,
            :inclusion => 1..1000,
            numericality: { greater_than: 0, Integer: true }

  validates :location,
            presence: true

  validate :start_must_be_before_end       # Validate ne porte pas de "S" lors d'une validation de methode

  validate :is_even_and_divisible_by_five?

  def start_must_be_before_end
    errors.add(:start_date, "The start date must be before end date") unless
      start_date > Time.now
  end

  def is_even_and_divisible_by_five?
    errors.add(:duration, "The duration must be a multiple of 5") unless
      duration % 5 == 0
  end
end
