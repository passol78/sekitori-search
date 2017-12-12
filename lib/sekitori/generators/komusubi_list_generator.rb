require_relative './list_generator.rb'

module Sekitori
  module Generators
    class KomusubiListGenerator < ListGenerator
      BANZUKE = '小結'.freeze
      URL = 'https://ja.wikipedia.org/wiki/小結一覧'.freeze

      TARGET_XPATH_LIST = [
        '//h2[contains(span/text(), "現役力士")]/following-sibling::ul/li//a',
        '//h2[contains(span/text(), "引退・廃業した力士")]/following-sibling::div/ul/li/a'
      ].freeze

      IGNORE_XPATH_LIST = [
        '//h2[contains(span/text(), "関連項目")]/following-sibling::ul/li//a'
      ].freeze
    end
  end
end
