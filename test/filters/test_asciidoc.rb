# encoding: utf-8

require 'helper'

class Nanoc::AsciiDoc::FilterTest < Minitest::Test

  def test_filter
    if `which asciidoc`.strip.empty?
      fail "could not find asciidoc"
    end

    # Create filter
    filter = ::Nanoc::AsciiDoc::Filter.new

    # Run filter
    result = filter.run("== Blah blah")
    assert_match %r{<h2 id="_blah_blah">Blah blah</h2>}, result
  end

end
