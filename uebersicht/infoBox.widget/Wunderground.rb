#!/usr/bin/env ruby

require 'wunderground'

# Weather Underground plugin for BitBar
# Adam Snodgrass <asnodgrass@sarchasm.us>
#
# Edited by Chris Sudderth to be used with Ubersicht (I just deleted some stuff, really)
# 
# Requires 'wunderground' gem and an API key from WU.
# http://www.wunderground.com/weather/api
#
# usage: Wunderground.1h.rb <api-key> [location-string [imperial-units]]
# Location-string can be any valid location identifier per WU's API docs.
# Imperial-units, if set to any value, will return imperial rather than SI.
#
# Alternatively, you can modify the values below to avoid using a wrapper
# script.


API_KEY = '561c939c17404a05'
LOCATION = 'autoip'
IMPERIAL = true

class WeatherPlugin
  def initialize(apikey, location = 'autoip', imperial = false)
    @wxu = Wunderground.new(apikey)
    @wxu.throws_exceptions = true
    @loc = location
    @imperial = imperial
  end

  def output
    cond = with_api_error_handling { current_conditions }
    update = formatted_time(cond['observation_epoch'].to_i)
    puts header(cond)
  end

  private

  def current_conditions
    if @loc.downcase.eql?('autoip')
      autoloc = @wxu.geolookup_for('autoip')
      @loc = format('%s,%s',
        autoloc['location']['lat'], autoloc['location']['lon']
      )
    end
    data = @wxu.conditions_for(@loc)
    data['current_observation']
  end

  def with_api_error_handling
    yield
  rescue Wunderground::MissingAPIKey => e
    puts 'WU API Error'
    exit
  rescue Wunderground::APIError => e
    puts 'WU API Error'
    exit
  end

  def header(cond)
    "#{temperature(cond, 'temp')}"
  end

  def temperature(cond, name)
    abbrev = @imperial ? 'F' : 'C'
    var = @imperial ? "#{name}_f" : "#{name}_c"
    format('%sº %s', cond[var], abbrev)
  end


  def pressure_trend(cond)
    case cond['pressure_trend']
    when '+' then 'rising'
    when '-' then 'falling'
    when '0' then 'steady'
    end
  end

  def formatted_time(epoch)
    Time.at(epoch).strftime('%a, %d %b %Y %T %z')
  end

  def gmaps_url(cond)
    format('http://maps.google.com/maps/place/%s,%s/@%s,%s,10z',
      cond['observation_location']['latitude'],
      cond['observation_location']['longitude'],
      cond['observation_location']['latitude'],
      cond['observation_location']['longitude']
    )
  end


end

if ARGV.empty?
  ARGV << API_KEY
  ARGV << LOCATION
  ARGV << IMPERIAL
end
plugin = WeatherPlugin.new(*ARGV)
plugin.output
