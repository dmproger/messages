#
# messages with fixed header size
# <header01 ><text>
# <header02 ><text>
# ...
# <header11 ><text>
# <header12 ><text>
#
module FixedHeader
  MASK = 'Часть00' # message counter at the right side
  SEP = ' ' # prevent counter number / text collisions
  MESSAGE_LENGTH = 70

  module_function

  def call(string)
    text_size = MESSAGE_LENGTH - (MASK.size + SEP.size)

    string.scan(/.{1,#{text_size}}/).map.with_index do |text, num|
      MASK[..-(num.to_s.size) - 1] + num.to_s + SEP + text
    end
  end
end
