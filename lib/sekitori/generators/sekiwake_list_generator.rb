require 'sekitori/generators/list_generator.rb'

module Sekitori::Generators
  class SekiwakeListGenerator < ListGenerator
    BANZUKE = "関脇"
    URL = "https://ja.wikipedia.org/wiki/関脇一覧"
  
    TARGET_XPATH_LIST = [
      '//h2[contains(span/text(), "現役力士")]/following-sibling::ul/li//a',
      '//h2[contains(span/text(), "引退・廃業した力士")]/following-sibling::div/ul/li/a'
    ]
  
    IGNORE_XPATH_LIST = [
      '//h2[contains(span/text(), "関連項目")]/following-sibling::ul/li//a',
    ]
  end
end