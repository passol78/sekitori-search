require 'sekitori/generators/list_generator.rb'

module Sekitori
  module Generators
    class JuryoListGenerator < ListGenerator
      BANZUKE = '前頭(十両)'.freeze
      URL = 'https://ja.wikipedia.org/wiki/大相撲力士一覧'.freeze

      TARGET_XPATH_LIST = [
        '//h2[contains(span/text(), "十両（十枚目）")]/following-sibling::div/ul/li/a'
      ].freeze

      IGNORE_XPATH_LIST = [
        '//h2[contains(span/text(), "幕下以下")]/following-sibling::div/ul/li/a'
      ].freeze
    end
  end
end
