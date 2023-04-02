#
# messages with flexible header size (via recursion)
# <header1 ><.text>
# <header2 ><.text>
# ...
# <header11 ><text>
# <header12 ><text>
# 
module FlexibleHeader
  PREFIX = 'Часть'
  SEP = ' '
  MESSAGE_LENGTH = 70

  module_function

  def call(string, num = 0, messages = [])
    header = PREFIX + num.to_s + SEP
    text = string[0..MESSAGE_LENGTH - header.size - 1]
    return messages if text.empty?

    call(string.delete_prefix(text), num + 1, messages << header + text)
  end
end
