require 'google_chart'
require './repoclass.rb'
require 'sinatra'
require 'sinatra/reloader'

#In your controller, create the data_table object, set new columns, 
#add row values, then instantiate the chart with configuration options. 
# Markers Example

def geo_map
 
  data_table_markers = GoogleVisualr::DataTable.new
  data_table_markers.new_column('string' , 'Country' )
  data_table_markers.new_column('number' , 'Popularity')
  data_table_markers.add_rows(6)
  data_table_markers.set_cell(0, 0, 'New York' )
  data_table_markers.set_cell(0, 1, 200)
  data_table_markers.set_cell(1, 0, 'Boston' )
  data_table_markers.set_cell(1, 1, 300)
  data_table_markers.set_cell(2, 0, 'Miami' )
  data_table_markers.set_cell(2, 1, 400)
  data_table_markers.set_cell(3, 0, 'Chicago' )
  data_table_markers.set_cell(3, 1, 500)
  data_table_markers.set_cell(4, 0, 'Los Angeles' )
  data_table_markers.set_cell(4, 1, 600)
  data_table_markers.set_cell(5, 0, 'Houston' )
  data_table_markers.set_cell(5, 1, 700)
   
  opts = { :dataMode => 'markers', :region => 'world', :colors => ['0xFF8747', '0xFFB581', '0xc06000'] }
  @chart_markers = GoogleVisualr::Interactive::GeoMap.new(data_table_markers, opts)
 
end

 

