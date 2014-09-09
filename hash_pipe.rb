require 'json'
require 'awesome_print'

file = File.read('data/quotes.json')

data_hash = JSON.parse(file)
authors = data_hash.keys
quotes = data_hash.values

words_in_file = ""

final_hash = {}

p "="*200
place_in_array = 0
quotes.each do |quote|
  quote_in_string = quote.join(" ")

  array_of_words = quote_in_string.split(" ")
  array_of_words.each do |word|
    if final_hash.has_key?(word)
      final_hash[word][:count] += 1
      final_hash[word][:people].push(authors[place_in_array])
    else
      final_hash[word] = { :count => 1, :people => Array.new(1,authors[place_in_array])}
    end

  end
  place_in_array += 1
end

ap final_hash