class Upload < ApplicationRecord
	has_attached_file :file,
					  styles: lambda { |a| a.instance.check_file_type}

	# validates_attachment :file, content_type: { content_type: "application/pdf" }
	validates_attachment_content_type :file, :content_type => ['application/pdf',
																														'application/msword', 
																														'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
																														'application/vnd.ms-excel',
																														'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' ]
	
	def check_file_type
    if is_pdf_type?
    	p '-----pdf-----'
      {}
    elsif is_spreadsheet_type?
      p '-----sheet-----'
      {}
    elsif is_doc_type?
    	p '-----doc-----'
      {}
    else
    	{}
    end
	end

	def is_pdf_type?
		p '-----pdf2-----'
		file_content_type =~ %r(pdf)
	end

	def is_spreadsheet_type?
		p '-----sheet2-----'
		file_content_type =~ %r(xls)
	end

	def is_doc_type?
		p '-----doc2-----'
		file_content_type =~ %r(docx)
	end

end
