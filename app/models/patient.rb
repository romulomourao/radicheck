class Patient < ApplicationRecord
  before_validation :strip_cpf

  validates_with CpfValidator
  validates :cpf, presence: true, uniqueness: true
  validates :name, presence: true

  has_many :patient_exams
  has_many :exams, through: :patient_exams

  scope :q, -> (query) { where("name LIKE ?", "%#{query}%").or(where(cpf: CPF.new(query).stripped))}

  #AGE: ((Time.zone.now - date_of_birth.to_time) / 1.year.seconds).floor
  def formatted_cpf
    CPF.new(self.cpf).formatted
  end

  private

  def strip_cpf
    self.cpf = CPF.new(self.cpf).stripped
  end
end
