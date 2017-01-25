module PdfTools
  class CPdf
    def self.split(source:, chunk:, target_dir: '.', filename: '%%%_@F_@S_@E.pdf')
      switch = "-split #{source} -chunk #{chunk} -o #{target_dir}/#{filename}"
      cmd    = [PdfTools::CPDF_APP, switch].join(' ')
      IO.popen cmd, 'r+' do |io|
        warn io.read
      end
    end

    def self.total_pages(source:)
      switch   = "-pages #{source}"
      cmd      = [PdfTools::CPDF_APP, switch].join(' ')
      pages = nil
      IO.popen cmd, 'r+' do |io|
        pages = io.read
      end
      pages.to_i
    end
  end
end