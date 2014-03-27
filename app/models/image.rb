class Image < ActiveRecord::Base
  validates_presence_of :uri
  validates_format_of :uri,
    with: /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/ ,
    message: "Valid URL is required"

  def self.random_image
    Image.limit(1).offset(rand(Image.count)).first.uri
  end

end
