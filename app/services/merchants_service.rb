class MerchantsService
  def self.get_url(url, keyword = nil)
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params[:api_key] = ENV['movie_api_key']
      faraday.params[:query] = keyword unless keyword.nil?
    end

    response = conn.get(url)

    JSON.parse(response.body, symbolize_names: true)
  end
end
