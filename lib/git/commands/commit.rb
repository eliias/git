# frozen_string_literal: true

require "git/author"
require "git/command"
require "git/commit"
require "git/constants"
require "git/database"
require "git/entry"
require "git/tree"
require "git/workspace"

module Git
  module Commands
    class Commit
      include Git::Command

      NAME = "commit"

      def self.call
        root_path = Pathname.new(Dir.getwd)
        git_path = root_path.join(Git::GIT_PATH)
        db_path = git_path.join("objects")

        workspace = Workspace.new(root_path)
        database = Database.new(db_path)

        entries = workspace.list_files.map do |path|
          data = workspace.read_file(path)
          blob = Blob.new(data)

          database.store(blob)

          Entry.new(path, blob.oid)
        end

        tree = Tree.new(entries)
        database.store(tree)

        name = ENV.fetch("GIT_AUTHOR_NAME")
        email = ENV.fetch("GIT_AUTHOR_EMAIL")
        author = Author.new(name, email, Time.now)
        message = $stdin.read

        commit = Git::Commit.new(tree.oid, author, message)
        database.store(commit)

        File.open(git_path.join("HEAD"), File::WRONLY | File::CREAT) do |file|
          file.puts(commit.oid)
        end

        puts "[(root-commit) #{ commit.oid }] #{ message.lines.first }"
        exit 0
      end
    end
  end
end
