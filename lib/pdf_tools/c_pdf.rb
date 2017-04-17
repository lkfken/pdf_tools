module PdfTools
  class CPdf
    def self.run(switch)
      cmd = [PdfTools::CPDF_APP, switch].join(' ')
      stdout(cmd)
    end

    def self.split(source:, chunk:, target_dir: '.', filename: '%%%_@F_@S_@E.pdf')
      switch = "-split #{source} -chunk #{chunk} -o #{target_dir}/#{filename}"
      run(switch)
    end

    def self.total_pages(source:)
      switch = "-pages #{source}"
      run(switch).to_i
    end

    private

    def self.stdout(cmd)
      output = nil
      IO.popen cmd, 'r+' do |io|
        output = io.read
      end
      output
    end
  end
end