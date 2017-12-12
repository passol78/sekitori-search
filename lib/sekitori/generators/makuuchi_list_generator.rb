require 'sekitori/generators/list_generator.rb'

module Sekitori::Generators
  class MakuuchiListGenerator < ListGenerator
    BANZUKE = "前頭(幕内)"
    URL = "https://ja.wikipedia.org/wiki/大相撲力士一覧"
  
    TARGET_XPATH_LIST = [
      '//h2[contains(span/text(), "幕内")]/following-sibling::div/ul/li/a'
    ]
  
    IGNORE_XPATH_LIST = [
      '//h2[contains(span/text(), "十両（十枚目）")]/following-sibling::div/ul/li/a'
    ]
  end
end
