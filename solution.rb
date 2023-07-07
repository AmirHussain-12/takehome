require 'find'

class Integer
  def to_filesize
    units = %w[B KB MB GB TB]
    size = to_f
    units.each do |unit|
      return "#{size.round(2)}#{unit}" if size < 1024

      size /= 1024.0
    end
  end
end

def create_index(base_dir, index_file)
  File.open(index_file, 'w') do |f|
    Find.find(base_dir) do |path|
      next unless File.file?(path)

      file_name = File.basename(path)
      file_size = File.size(path).to_filesize
      file_type = File.extname(path).downcase[1..].to_s

      index_entry = "#{file_name}\t#{file_size}\t#{file_type}\t#{path}\n"
      f.write(index_entry)
    end
  end
end

def search_index(index_file, query)
  results = []
  File.foreach(index_file) do |line|
    file_name, file_size, file_type, file_path = line.strip.split("\t")
    if /#{query.downcase}/ =~ file_name.downcase || /#{query.downcase}/ =~ file_type.downcase
      results << [file_name, file_size, file_type, file_path]
    end
  end

  results
end

# The Path of Base Directory
base_directory = './test_data'
# The Path of Index File
index_file_path = './index.txt'

create_index(base_directory, index_file_path)

loop do
  puts '------------------------------'
  puts '1. Search by name or type'
  puts '2. Exit'
  puts '------------------------------'
  print 'Enter your choice: '
  choice = gets.chomp

  case choice
  when '1'
    print 'Enter the search query: '
    query = gets.chomp
    results = search_index(index_file_path, query)

    if results.empty?
      puts 'No matching files found.'
    else
      puts '=============================='
      puts 'Search Results:'
      results.each do |file_name, file_size, file_type, file_path|
        puts "Name: #{file_name}, Size: #{file_size}, Type: #{file_type}, Path: #{file_path}"
      end
      puts '=============================='
    end

    puts
  when '2'
    break
  else
    puts 'Invalid choice. Please try again.'
    puts
  end
end
