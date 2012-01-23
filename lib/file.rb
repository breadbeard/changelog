require 'tempfile'

class File
  def self.prepend(path, string)

    if File.exists?(path)
      Tempfile.open File.basename(path) do |tempfile|
        # prepend data to tempfile
        tempfile << string

        File.open(path, 'r+') do |file|
          # append original data to tempfile
          tempfile << file.read
          # reset file positions
          file.pos = tempfile.pos = 0
          # copy all data back to original file
          file << tempfile.read
        end
      end
    else
      File.open(path, 'w') do |file|
        file.write(string)
      end
    end

  end
end
