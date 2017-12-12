require 'sekitori/generators/list_generator.rb'

module Sekitori::Generators
  class JuryoListGenerator < ListGenerator
    BANZUKE = "前頭(十両)"
    URL = "https://ja.wikipedia.org/wiki/大相撲力士一覧"

    TARGET_XPATH_LIST = [
      '//h2[contains(span/text(), "十両（十枚目）")]/following-sibling::div/ul/li/a'
    ]

    IGNORE_XPATH_LIST = [
      '//h2[contains(span/text(), "幕下以下")]/following-sibling::div/ul/li/a'
    ]
  end
end
