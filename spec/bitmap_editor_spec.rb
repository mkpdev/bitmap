require './lib/bitmap_editor'

class BitmapEditorSpec

  describe ".BitmapEditor" do
    subject { BitmapEditor.new }
    
    it "should return expected result of file examples/show.txt" do
      result = subject.run("examples/show.txt").bitmap.collect(&:join).join("\n")

      expect(result).to eq("ooooo\nooZZZ\nAWooo\noWooo\noWooo\noWooo")
    end

    it "should return expected result of file examples/show-1.txt" do
      result = subject.run("examples/show-1.txt").bitmap.collect(&:join).join("\n")

      expect(result).to eq("oFFFFo\noPoooo\noPoooo\noPoooo\noPoooo\nooooQo\nooooQo\nooooQo")
    end
  end
end