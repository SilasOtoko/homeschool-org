class Assignment < ActiveRecord::Base
  belongs_to :student
  
  has_attached_file :document
  validates_attachment :document, content_type: {content_type: %w(image/jpeg image/jpg image/png application/txt text/plain application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}

  def self.extension_image(file)
    ext = file.to_s
    if ext.include?(".pdf")
      "fa fa-file-pdf-o"
    elsif ext.include?(".txt")
     "text.png"
    else
      "folder.txt"
    end
  end

end