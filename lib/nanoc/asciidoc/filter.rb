# encoding: utf-8

module Nanoc::AsciiDoc

  class Filter < Nanoc::Filter

    identifier :asciidoc

    requires 'systemu'

    def run(content, params={})
      # Run command
      stdout = ''
      stderr = ''
      status = systemu(
        [ 'asciidoc', '-o', '-', '-' ],
        'stdin'  => content,
        'stdout' => stdout,
        'stderr' => stderr)

      # Show errors
      unless status.success?
        $stderr.puts stderr
        raise RuntimeError, "AsciiDoc filter failed with status #{status}"
      end

      # Get result
      stdout
    end

  end

end
