require './lib/bitmap'

class BitmapEditor
  def run(file)
    return puts 'please provide correct file' if invalid?(file)

    bitmap = Bitmap.new
    File.open(file).each do |line|
      params = line.chomp
                   .split(' ')
                   .map { |e| e =~ /\d+/ ? e.to_i : e }

      action = get_method(params.shift)

      bitmap.public_send(action, *params)
    end
    bitmap
  end

  private

  def invalid?(file)
    file.nil? || !File.exist?(file)
  end

  def get_method(param)
    case param
    when 'I' then :create
    when 'C' then :clear_bitmap
    when 'L' then :pixel_color
    when 'V' then :vertical_color
    when 'H' then :horizontal_color
    when 'S' then :to_s
    else :unrecognised
    end
  end
end
