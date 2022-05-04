module FlightsHelper
  def available_flights(search_results)
    unless search_results.empty?
      render "search_results"
    end
  end
end
