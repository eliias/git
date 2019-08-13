# frozen_string_literal: true

module Git
  class Entry
    attr_reader :name
    attr_reader :oid

    def initialize(name, oid)
      @name = name
      @oid = oid
    end
  end
end
