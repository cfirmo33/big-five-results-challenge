require './app/results_serializer'
require './app/results_poster'

results_text = File.read("results.txt")
hash = ResultsSerializer.new(text: results_text).to_hash
poster = ResultsPoster.new(hash: hash)
p poster.post
p poster.response_code
p poster.token
