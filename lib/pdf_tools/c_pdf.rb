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

    def self.merge(sources:, target:)
      sources = CPdf.pathnames_with_quotes(sources)
      target = CPdf.pathname_with_quotes(target)
      switch = "#{sources.join(' ')} -o #{target}"
      run(switch)
    end

    private

    def self.pathname_with_quotes(pathname)
      '"%s"' % pathname.to_s
    end

    def self.pathnames_with_quotes(filenames)
      filenames.map { |fn| pathname_with_quotes(fn)}
    end

    def self.stdout(cmd)
      output = nil
      IO.popen cmd, 'r+' do |io|
        output = io.read
      end
      output
    end
  end
end