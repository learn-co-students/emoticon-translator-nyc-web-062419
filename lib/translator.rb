# require modules her
require "yaml"
def load_library lib 
  contain = {"get_meaning"=>{},"get_emoticon"=>{}} 
  emoticons = YAML.load_file lib
  emoticons.each do |define,arr|
    contain["get_meaning"][arr[1]] = define
    contain["get_emoticon"][arr[0]] = arr[1]
  end
  contain
end

def get_japanese_emoticon lib,emoticon
  check_hash = load_library lib
  if check_hash["get_emoticon"][emoticon]
    check_hash["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning lib,emoticon
  check_hash = load_library lib
  if check_hash["get_meaning"][emoticon]
    check_hash["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end