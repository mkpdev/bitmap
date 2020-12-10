require './lib/bitmap'

class BitmapEditor

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    bitmap = Bitmap.new
    File.open(file).each do |line|
      params = line.chomp
                   .split(' ')
                   .map { |e| e.match?(/\d+/)? e.to_i : e }

      action = case params.shift
        when 'I' then :create
        when 'C' then :clear_bitmap
        when 'L' then :pixel_color
        when 'V' then :vertical_color
        when 'H' then :horizontal_color
        when 'S' then :to_s
        else :unrecognised
        end

      bitmap.public_send(action, *params)
    end
  end
end
