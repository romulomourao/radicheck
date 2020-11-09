class Patient < ApplicationRecord

  validates :cpf, presence: true, uniqueness: true
  validates :name, presence: true

  has_many :patient_exams
  has_many :exams, through: :patient_exams

  scope :q, -> (query) { where("name LIKE ?", "%#{query}%").or(where(cpf: query))}

  #AGE: ((Time.zone.now - date_of_birth.to_time) / 1.year.seconds).floor
end
