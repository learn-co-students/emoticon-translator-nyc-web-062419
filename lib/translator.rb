# require modules here

def load_library(file)
  # code goes here
  require "yaml"
  emotes = YAML.load_file(file)
  processed = {"get_meaning" => {}, "get_emoticon" => {}}
  emotes.each do |meaning, pair|
    processed["get_meaning"][pair[1]] = meaning
    processed["get_emoticon"][pair[0]] = pair[1]
  end
  processed
end


def get_japanese_emoticon(path, emote)
  # code goes here
  emotes = load_library(path)
  if emotes["get_emoticon"].keys.include? emote
    emotes["get_emoticon"][emote]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning (path, emote)
  # code goes here
  emotes = load_library(path)
  if emotes["get_meaning"].keys.include? emote
    emotes["get_meaning"][emote]
  else
    "Sorry, that emoticon was not found"
  end
end