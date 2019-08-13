# frozen_string_literal: true

require "git/command"

module Git
  module Commands
    class Unknown
      include Git::Command

      def self.call(command)
        warn "git: '#{command}' is not a git command."
        exit 1
      end
    end
  end
end
