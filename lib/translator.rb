# require modules here
require "yaml"
require "pry"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  
  new_hash = {}

  emoticons.each do |key, inner_array|
    if !new_hash[key]
      new_hash[key] = {:english => inner_array[0], :japanese => inner_array[1]}
    end
  end
  new_hash
end

def get_english_meaning(file_path, emoticon)
  emoticons_hash = load_library(file_path)

  emoticons_hash.each do |english_name,eng_and_jap_hash|
    eng_and_jap_hash.each do |lang, emoji|
      if emoji == emoticon
        return english_name
      end
    end
  end
  "Sorry, that emoticon was not found"
end

def get_japanese_emoticon(file_path, emoticon)
  emoticon_hash = load_library(file_path)

  emoticon_hash.each do |name, eng_jap_hash|
    if eng_jap_hash[:english] == emoticon
      return eng_jap_hash[:japanese]
    end
  end
  "Sorry, that emoticon was not found"
end
































































# def load_library(file_path)
#   emoticons = YAML.load_file(file_path)
 
#   new_hash = {}
#   emoticons.each do |emoticon_name, array_of_emoticons|
#     if !new_hash[emoticon_name]
#         new_hash[emoticon_name] = {}
#     end
    
#     if !new_hash[emoticon_name][:english]
#         new_hash[emoticon_name][:english] = array_of_emoticons[0]
#     end
    
#     if !new_hash[emoticon_name][:japanese]
#         new_hash[emoticon_name][:japanese] = array_of_emoticons[1]
#     end
#   end
#   new_hash
# end


# def get_japanese_emoticon(file_path, emoticon)
#   emoticon_hash = load_library("./lib/emoticons.yml")
  
#   emoticon_hash.each do |emoticon_name, inner_hash_of_english_and_japanese|
#     if inner_hash_of_english_and_japanese[:english] == emoticon
#       return inner_hash_of_english_and_japanese[:japanese]
#     end
#   end
#   return "Sorry, that emoticon was not found"
# end

# def get_english_meaning(file_path, emoticon)
#   emoticon_hash = load_library("./lib/emoticons.yml")
  
#   emoticon_hash.each do |emoticon_name, inner_hash_of_english_and_japanese|
#     if inner_hash_of_english_and_japanese[:japanese] == emoticon 
#       return emoticon_name
#     end
#   end 
#   return "Sorry, that emoticon was not found"
# end

