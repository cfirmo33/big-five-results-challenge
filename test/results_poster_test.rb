require 'minitest/autorun'
require 'webmock/minitest'
require './app/results_poster'

describe ResultsPoster do

  describe "#post" do
    it "should post the Big 5 results to the Recruitbot api" do
      hash = {
        'NAME' => 'Leandro Alvares da Costa',
        'EXTRAVERSION' => {
          'Overall Score' => 68,
          'Facets' => {
            'Friendliness' => 94,
            'Cheerfulness' => 57
          }
        },
        'AGREEABLENESS' => {
          'Overall Score' => 89,
          'Facets' => {
            'Trust' => 92,
            'Sympathy' => 90
          }
        }
      }
      poster = ResultsPoster.new(hash: hash)

      stub_request(:post, ResultsPoster::ENDPOINT).
        with(body: hash.to_json, headers: { 'Content-Type' => 'application/json' }).
        to_return(status: 201, body: 'abc')

      assert poster.post
      assert_equal 201, poster.response_code
      assert_equal 'abc', poster.token
    end

    it "shouldn't post the Big 5 results to the Recruitbot api" do
      hash = {}
      poster = ResultsPoster.new(hash: hash)

      stub_request(:post, ResultsPoster::ENDPOINT).
        with(body: hash.to_json, headers: { 'Content-Type' => 'application/json' }).
        to_return(status: 422, body: 'message')

      assert_equal false, poster.post
      assert_equal 422, poster.response_code
      assert_equal 'message', poster.token
    end
  end

end
