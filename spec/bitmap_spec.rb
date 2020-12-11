require './lib/bitmap'

class BitmapSpec
  describe ".BitmapEditor" do
    subject { Bitmap.new }
    
    it "should return basic array of given height weight" do
      subject_create = subject.create(5, 6)
      result         = subject_create.collect(&:join).join("\n")
      expect(result).to eq("ooooo\nooooo\nooooo\nooooo\nooooo\nooooo")
    end

    it "should return array with given color at pixel" do
      subject.create(5, 6)
      subject.pixel_color(2, 3, 'A')
      
      result = subject.bitmap.collect(&:join).join("\n")

      expect(result).to eq("ooooo\nooooo\noAooo\nooooo\nooooo\nooooo")
    end

    it "should return array with horizontal color" do
      subject.create(6, 6)
      subject.horizontal_color(3, 5, 2, 'Z')
      
      result = subject.bitmap.collect(&:join).join("\n")

      expect(result).to eq("oooooo\nooZZZo\noooooo\noooooo\noooooo\noooooo")
    end

    it "should return array with vertical color" do
      subject.create(4, 7)
      subject.vertical_color(2, 3, 6, 'P')
      
      result = subject.bitmap.collect(&:join).join("\n")

      expect(result).to eq("oooo\noooo\noPoo\noPoo\noPoo\noPoo\noooo")
    end
  end
end
