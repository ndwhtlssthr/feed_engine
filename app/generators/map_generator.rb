class MapGenerator
  def self.call(data)
    data.each do |state|
      s = MapState.new
      s.short_name  = CensusDataMapper::STATE_NAMES[state["properties"]["STATE"]]
      s.name        = state["properties"]["NAME"]
      s.census_area = state["properties"]["CENSUSAREA"]
      s.geometry = { coordinates: state["geometry"]["coordinates"] }
      s.save
    end
  end
end
