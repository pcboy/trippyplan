require "trippyplan/version"

require 'geocoder'
require 'kmeans-clusterer'
require 'yaml'
require 'rest-client'

module Trippyplan
  class Trippyplan
    def initialize(days, tsv: nil, advisor: nil)
      @days = days
      if tsv
        @addresses = File.read(tsv).split("\n").map{|x| x.split("\t")}.map{|x| {x[0] => x[1]}}.reduce(:merge)
        @addresses = addresses_to_coords(@addresses)
      end
      if advisor[:list] && advisor[:headers]
        headers = YAML.load_file(advisor[:headers])
        ap headers
        body = RestClient.get("https://www.tripadvisor.com/data/1.0/trips/list/#{advisor[:list]}",
                       {
                        :Cookie => headers['cookie'],
                        'X-Requested-By' => headers['js_security_token'],
                        }
                      )
        @addresses = tripadvisor_to_coords(body)
      end
    end

    def clusterize
      ap @addresses
      kmeans = KMeansClusterer.run @days, @addresses.values, labels: @addresses.keys, runs: 10
      kmeans.clusters
    end

    private

    def tripadvisor_to_coords(body)
      json = JSON.parse(body)
      json['nodes'].map do |n|
        content = n['content']
        { content['name'] => [content['latitude'], content['longitude']].map(&:to_f) }
      end.reduce(:merge)
    end

    def addresses_to_coords(addresses)
      addresses.map do |label, address|
        if coord = Geocoder.search(address).first
          { label => coord.data['geometry']['location'].values.map(&:to_f) }
        else
          abort "can't find coordinates of #{address}"
        end
      end.reduce(:merge)
    end
  end
end
