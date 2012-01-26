#!/usr/bin/ruby

  require 'pathname'

  def find_depth_first(pathname)
    acc = []
    pathname.find { |file| acc << file }
    acc.reverse!
    acc.each { |path| yield path }
  end

  find_depth_first(Pathname(".")) { |path|
    if path.directory?
      new_path = path.dirname + Pathname(path.basename.to_s.downcase)
      if new_path != path
        path.rename(new_path)
      end
    end
  }
