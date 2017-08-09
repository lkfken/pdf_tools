# PdfTools

A wrapper for Coherent PDF (cpdf) and PDFtk

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pdf_tools', :git => 'https://github.com/lkfken/pdf_tools.git'
```

And then execute:

    $ bundle

## Usage

Split a .pdf file into multiple .pdf files, each 100 pages:

    PdfTools.split(source: 'some_file.pdf', chunk: 100, target_dir: '.', filename: '%%%_@F_@S_@E.pdf')

    %, %%, %%%, etc. Sequence number padded to the number of percent signs
    @F Original filename without extension
    @N Sequence number wihtout padding zeroes
    @S Start page of this chunk
    @E End page of this chunk
    @B Bookmark name at this page
    
Extract random pages of a .pdf file:

    PdfTools.extract(pages: '1 4 17 20-22 31 36', source: 'tmp/penn_2.pdf', target_dir: './tmp', filename: 'Summary.pdf')
   
Merge .pdf files into one:

     pdf_sources = ['a.pdf', 'b.pdf', 'c.pdf']
     target = 'final.pdf'
     PdfTools.merge(sources: pdf_sources, :target => target)
     
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lkfken/pdf_tools. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

