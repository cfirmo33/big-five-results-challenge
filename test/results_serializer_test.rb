require 'minitest/autorun'
require './app/results_serializer'

describe ResultsSerializer do

  describe "#to_hash" do
    it "should serialize a results text to a hash respecting the sorting" do
      results_text = %{
        EXTRAVERSION...............68
        ..Friendliness.............94
        ..Cheerfulness.............57
        AGREEABLENESS..............89
        ..Trust....................92
        ..Sympathy.................90
        CONSCIENTIOUSNESS..........79
        ..Self-Efficacy............67
        ..Orderliness..............66
      }
      results_hash = ResultsSerializer.new(text: results_text).to_hash

      assert_equal({
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
        },
        'CONSCIENTIOUSNESS' => {
          'Overall Score' => 79,
          'Facets' => {
            'Self-Efficacy' => 67,
            'Orderliness' => 66
          }
        }
      }.to_s, results_hash.to_s)
    end
  end

end
