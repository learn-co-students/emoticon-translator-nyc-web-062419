# frozen_string_literal: true

# require modules here
require 'yaml'
require 'pry'

def load_library(library)
  library = { 'get_meaning' => {}, 'get_emoticon' => {} }
  YAML.load_file('./lib/emoticons.yml').each do |emo_definition, arr|
    library['get_emoticon'][arr[0]] = arr[1]
    # binding.pry
    library['get_meaning'][arr[1]] = emo_definition
    # binding.pry
  end
  library
end

def get_japanese_emoticon(library, emoticon)
  library = load_library(library)
  library['get_emoticon'][emoticon] || 'Sorry, that emoticon was not found'
   # binding.pry
end

def get_english_meaning(library, emoticon)
  library = load_library(library)
  library['get_meaning'][emoticon] || 'Sorry, that emoticon was not found'
   # binding.pry
end
