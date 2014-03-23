class ValidString
  def self.long_string
   "Donec sed odio dui. Donec sed odio dui. "+
   "Fusce dapibus, tellus ac cursus commodo, "+
   "tortor mauris condimentum nibh, ut fermentum "+
   "massa justo sit amet risus. Sed posuere consectetur"+
   "est at lobortis. Maecenas faucibus mollis interdum." 
  end

  def self.short
    random_string(5)
  end

  def self.random_string(length)
   awesome_text = "PBR non literally, odio beard nisi put a bird on it vero nihil"+
      "Intelligentsia tousled. Etsy cillum tousled Williamsburg deep v"+
      "ea, Pitchfork tofu bitters you probably haven't heard of them"+
      "nihil asymmetrical slow-carb VHS. Leggings VHS asymmetrical "+
      "seitan direct trade, dolore beard freegan Pitchfork hoodie"+
      "readymade. Keytar swag enim, nihil adipisicing readymade artisan "+
      "laboris beard selfies. Ad odio sed, Williamsburg selvage readymade"+
      "VHS ut biodiesel shabby chic flannel paleo lomo. Messenger"+
      "bag Schlitz Pinterest, aliquip trust fund butcher Pitchfork "+
      "kale chips salvia Banksy art party normcore bicycle rights organic."+
      "Master cleanse banh mi scenester dreamcatcher Marfa Pitchfork swag kale chips."

    awesome_text = awesome_text.split(" ").shuffle!
    awesome_text.take(length).join(" ")
  end

  def self.url
    Faker::Internet.url
  end
end
