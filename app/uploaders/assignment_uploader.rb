# encoding: utf-8

class AssignmentUploader < CarrierWave::Uploader::Base
include CarrierWave::MiniMagick
  storage :file
  
  def cover 
    manipulate! do |frame, index|
      frame if index.zero?
    end
  end   

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  process convert: 'png'

  def filename
    super.chomp(File.extname(super)) + '.png' if original_filename.present?
  end

end
