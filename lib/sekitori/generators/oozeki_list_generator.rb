require 'sekitori/generators/list_generator.rb'

module Sekitori::Generators
  class OozekiListGenerator < ListGenerator
    BANZUKE = "大関"
    URL = "https://ja.wikipedia.org/wiki/大関一覧"
  
    TARGET_XPATH_LIST = [
      '//h2[contains(span/text(), "現役力士")]/following-sibling::ul[1]/li//a',
      '//h2[contains(span/text(), "引退した力士")]/following-sibling::div/ul/li/a'
    ]
  end
end
