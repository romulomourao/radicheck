class CpfValidator < ActiveModel::Validator
  # require "cpf_cnpj"
  def validate(record)
    unless CPF.valid?(record.cpf)
      record.errors.add(:cpf, "formato inválido")
    end
  end
end


