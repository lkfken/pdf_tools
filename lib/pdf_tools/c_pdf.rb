module PdfTools
  class CPdf
    def self.split(source:, chunk:, target_dir: '.', filename: '%%%_@F_@S_@E.pdf')
      switch = "-split #{source} -chunk #{chunk} -o #{target_dir}/#{filename}"
      cmd    = [PdfTools::CPDF_APP, switch].join(' ')
4
      IO.popen cmd, 'r+' do |io|
        warn io.read
      end
    end
  end
end