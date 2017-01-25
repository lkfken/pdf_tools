require "pdf_tools/version"
require 'rbconfig'
require_relative 'pdf_tools/c_pdf'
require_relative 'pdf_tools/pdf_tk'

raise 'It only works on Windows platform' unless RbConfig::CONFIG['host_os'] =~ /mswin|windows|cygwin/i

module PdfTools
  GEMPATH   = File.dirname(File.dirname(__FILE__))
  CPDF_APP  = File.join(PdfTools::GEMPATH, 'vendor', 'cpdf', 'cpdf.exe')
  PDFTK_APP = File.join(PdfTools::GEMPATH, 'vendor', 'pdftk', 'pdftk.exe')

  class Helper
    def self.split(params={})
      PdfTools::CPdf.split(params)
    end
    def self.extract(params={})
      PdfTools::PDFtk.extract(params)
    end
  end
end
