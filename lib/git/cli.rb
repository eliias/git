# frozen_string_literal: true

require "git/commands/commit"
require "git/commands/init"
require "git/commands/unknown"

module Git
  class CLI
    def self.call
      command = ARGV.shift

      case command
      when Git::Commands::Commit::NAME
        Git::Commands::Commit.call
      when Git::Commands::Init::NAME
        Git::Commands::Init.call
      else
        Git::Commands::Unknown.call(command)
      end
    end
  end
end
