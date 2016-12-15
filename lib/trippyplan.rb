require "trippyplan/version"

require 'geocoder'
require 'kmeans-clusterer'

module Trippyplan
  class Trippyplan
    def initialize(days)
      @days = days
    end

    def clusterize(addresses)
      coords = addresses.map do |address|
        if coord = Geocoder.search(address).first
          ap coord.data['geometry']
          coord.data['geometry']['location'].values.map(&:to_f)
        else
          abort "can't find coordinates of #{address}"
        end
      end

      kmeans = KMeansClusterer.run @days, coords, labels: addresses, runs: 10
      kmeans.clusters
    end
  end
end
