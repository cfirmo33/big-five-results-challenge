require 'net/http'
require 'json'

class ResultsPoster
  ENDPOINT = 'https://recruitbot.trikeapps.com/api/v1/roles/mid-senior-web-developer/big_five_profile_submissions.json'
  attr_reader :response_code, :token

  def initialize(args)
    @hash = args.fetch(:hash)
  end

  def post
    uri = URI.parse(ENDPOINT)
    request = Net::HTTP::Post.new(uri.path, 'Content-Type' => 'application/json')
    request.body = @hash.to_json
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    end
    @response_code = response.code.to_i
    @token = response.body

    @response_code == 201
  end

end
