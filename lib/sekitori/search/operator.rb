require 'sekitori/generators/all'

module Sekitori::Search
  class Operator
    def initialize
      @yokozuna_generator = Sekitori::Generators::YokozunaListGenerator.new
      @oozeki_generator = Sekitori::Generators::OozekiListGenerator.new
      @sekiwake_generator = Sekitori::Generators::SekiwakeListGenerator.new
      @komusubi_generator = Sekitori::Generators::KomusubiListGenerator.new
      @makuuchi_generator = Sekitori::Generators::MakuuchiListGenerator.new
      @juryo_generator = Sekitori::Generators::JuryoListGenerator.new
      @makushita_generator = Sekitori::Generators::MakushitaListGenerator.new

      @sekitori_generators = [
        @yokozuna_generator,
        @oozeki_generator,
        @sekiwake_generator,
        @komusubi_generator,
        @makuuchi_generator,
        @juryo_generator,
        @makuuchi_generator
      ]

      @rikishi_generators = @sekitori_generators + [@makushita_generator]
    end

    def sekitori_search_from(word)
      search_from word, sekitori_hash
    end

    def rikishi_search_from(word)
      search_from word, rikishi_hash
    end

    def sekitori_detail_search_from(name)
      detail_search_from name, sekitori_list
    end

    def rikishi_detail_search_from(name)
      detail_search_from name, rikishi_list
    end

    private

    def sekitori_hash
      @sekitori_generators.reduce({}) { |work, item| work.merge item.to_h }
    end

    def sekitori_list
      @sekitori_generators.map(&:list).flatten
    end

    def rikishi_hash
      @rikishi_generators.reduce({}) { |work, item| work.merge item.to_h }
    end

    def rikishi_list
      @rikishi_generators.map(&:list).flatten
    end

    def search_from(word, hash)
      sekitori_result = hash.map do |key, list|
        filterd_list = list.select { |name| name.include? word }
        [key, filterd_list]
      end.to_h
    end

    def detail_search_from(name, list)
      result = list.find { |rikishi| rikishi == name }
      if result
        "https://ja.wikipedia.org/wiki/#{result.tr(' ', '_')}"
      else
        puts '見つかりませんでした'
      end
    end
  end
end
