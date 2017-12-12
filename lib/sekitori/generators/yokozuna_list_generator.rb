require 'sekitori/generators/list_generator.rb'

module Sekitori
  module Generators
    class YokozunaListGenerator < ListGenerator
      BANZUKE = '横綱'.freeze
      URL = 'https://ja.wikipedia.org/wiki/横綱一覧'.freeze

      TARGET_XPATH_LIST = ['//h2[contains(span/text(), "歴代横綱")]/following-sibling::table[1]//td[1]//a'].freeze
    end
  end
end
