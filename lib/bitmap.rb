class Bitmap
  attr_reader :height, :width, :bitmap

  def create(width, height)
    @width  = width
    @height = height
    @bitmap = Array.new(height) { Array.new(width) { 'o' } }
  end

  def pixel_color(x, y, color = 'o')
    @bitmap[y - 1][x - 1] = color
  end

  def horizontal_color(x1, x2, y, color)
    (x1..x2).each { |x| pixel_color(x, y, color) }
  end

  def vertical_color(x, y1, y2, color)
    (y1..y2).each { |y| pixel_color(x, y, color) }
  end

  def clear_bitmap
    (1..height).each { |y| horizontal_color(1, width, y, 'o') }
  end

  def to_s
    puts @bitmap.collect(&:join).join("\n")
  end

  def unrecognised
    puts 'unrecognised command :('
  end
end
