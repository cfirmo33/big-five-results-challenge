class ResultsSerializer

  def initialize(args)
    @text = args.fetch(:text)
    @text.strip!
  end

  def to_hash
    {'NAME' => 'Leandro Alvares da Costa'}.merge!(
      build_results_hash({}, {}, @text.lines.size)
    )
  end

  private

  def build_results_hash(domains, facets, size)
    return domains if size < 0

    line = @text.lines[size-1]
    if domain?(line)
      domains = Hash[title(line) => {
        'Overall Score' => score(line),
        'Facets' => facets.clone
      }].merge(domains)
      facets.clear
    else
      facets = Hash[title(line) => score(line)].merge(facets)
    end

    build_results_hash(domains, facets, size-1)
  end

  def domain?(line)
    line.strip[0] != '.'
  end

  def title(line)
    line[0, 27].gsub('.', '').strip
  end

  def score(line)
    line.strip[27, 28].to_i
  end

end
