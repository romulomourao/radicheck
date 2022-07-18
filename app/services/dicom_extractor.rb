class DicomExtractor
  require 'dicom'
  include DICOM

  def initialize(file)
    @file = file
  end

  def call
    DObject.read(file).to_hash
  end

  def parse
    raise NotImplementedError, 'You must implement the parse method'
  end


  protected

  attr_accessor :file
end
