# require modules here
require 'yaml'
require 'pry'

def load_library(yaml_file)
  yaml_data = YAML::load(File.open(yaml_file))
  definition_hash = {}
  yaml_data.each do |definition, array_of_emoticons|
    japanese_emoticon = yaml_data[definition][1]
    definition_hash["get_meaning"] ||= {}
    definition_hash["get_meaning"][japanese_emoticon] ||= definition
  end
  yaml_data.each do |definition, array_of_emoticons|
    english_emoticon = yaml_data[definition][0]
    japanese_emoticon = yaml_data[definition][1]
    definition_hash["get_emoticon"] ||= {}
    definition_hash["get_emoticon"][english_emoticon] ||= japanese_emoticon
  end
  definition_hash
end

def get_japanese_emoticon(yaml_file, emoticon)
  emoticon_finder = load_library(yaml_file)
  if emoticon_finder["get_emoticon"][emoticon]
    emoticon_finder["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(yaml_file, emoticon)
  emoticon_finder = load_library(yaml_file)
  if emoticon_finder["get_meaning"][emoticon]
    emoticon_finder["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end
