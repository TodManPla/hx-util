#  require 'pathname'

  Dir.foreach(".") do |filename|
    if FileTest.directory?(filename)
    else
      newname = "#{ARGV[0]}" + filename
      File.rename(filename,newname)
      puts "#{filename} -> #{newname}"
    end
  end
