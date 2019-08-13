# frozen_string_literal: true

require "git/constants"

module Git
  class Workspace
    IGNORE = [".", "..", Git::GIT_PATH].freeze

    def initialize(pathname)
      @pathname = pathname
    end

    def list_files
      Dir.entries(@pathname) - IGNORE
    end

    def read_file(path)
      File.read(@pathname.join(path))
    end
  end
end
