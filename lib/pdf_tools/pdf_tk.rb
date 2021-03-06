module PdfTools
  class PDFtk
    def self.extract(source:, pages:, target_dir: '.', filename:)
      output_filename = File.join(target_dir, filename)
      switch          = "#{source} cat #{pages} output #{output_filename}"
      cmd             = [PDFTK_APP, switch].join(' ')
      message         = nil
      IO.popen cmd, 'r+' do |io|
        message = io.read
      end
      message
    end
  end
end
