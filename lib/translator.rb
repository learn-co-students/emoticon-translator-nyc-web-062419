# require modules here
require "yaml"
require 'pry'

def load_library(file_path)
  # code goes here
  library = YAML.load_file(file_path)
  
  get_meaning = {}
  get_emoticon = {}
  library.each do |meaning, emoticons|
    english = emoticons[0]
    japanese = emoticons[1]
    get_meaning[japanese] = meaning
    get_emoticon[english] = japanese
  end

  library = {"get_meaning" => get_meaning, "get_emoticon" => get_emoticon}

end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  if library["get_emoticon"].keys.include?(emoticon)
    japanese_emoticon = library["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
  # code goes here
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  library = load_library(file_path)
  if library["get_meaning"].keys.include?(emoticon)
    english_meaning = library["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end