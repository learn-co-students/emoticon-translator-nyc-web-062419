# require modules here
require 'yaml'
require 'pry'

def load_library(path)
  hash = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  YAML.load_file(path).each do |key, val|
    english, japanese = val
    hash["get_meaning"][japanese] = key
    hash["get_emoticon"][english] = japanese 
  end
  hash
end

def get_japanese_emoticon(path, emoticon)
  hash = load_library(path)
  equiv = hash["get_emoticon"][emoticon]
    if equiv == nil
      equiv = "Sorry, that emoticon was not found"
    end
    equiv
end

def get_english_meaning(path, emoticon)
  hash = load_library(path)
  equiv = hash["get_meaning"][emoticon]
    if equiv == nil
      equiv = "Sorry, that emoticon was not found"
    end
    equiv
end