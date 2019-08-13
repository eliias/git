# frozen_string_literal: true

require "git/command"
require "git/constants"

module Git
  module Commands
    class Init
      include Git::Command

      NAME = "init"

      def self.call
        path = ARGV.fetch(0, Dir.getwd)

        root_path = Pathname.new(File.expand_path(path))
        git_path = root_path.join(Git::GIT_PATH)

        %w[objects ref].each do |dir|
          FileUtils.mkdir_p(git_path.join(dir))
        rescue Errno::EACCESS => e
          warn "fatal: #{e.message}"
          exit 1
        end

        puts "Initialized empty Git repository in #{git_path}"
        exit 0
      end
    end
  end
end
