require 'sekitori/generators/list_generator.rb'

module Sekitori
  module Generators
    class MakushitaListGenerator < ListGenerator
      BANZUKE = '前頭(幕下)'.freeze
      URL = 'https://ja.wikipedia.org/wiki/大相撲力士一覧'.freeze

      TARGET_XPATH_LIST = [
        '//h2[contains(span/text(), "幕下以下")]/following-sibling::div/ul/li/a'
      ].freeze
    end
  end
end
