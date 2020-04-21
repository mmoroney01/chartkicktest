# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require 'date'


foo = CSV.read("COVID-Projections--US_Population-Scaled--SKorea_ChinaHubei_Italy--LogisticModels--2020_04_01_fewerDataPoints.csv")

foo.drop(1).each do |arr|
  if arr[1] != nil
    us_actual = arr[1].to_i
  else
    us_actual = nil  
  end
  if arr[2] != nil
    unchecked = arr[2].to_f
  else
    unchecked = nil
  end
  if arr[3] != nil
    it = arr[3].to_f
  else
    it = nil  
  end
  if arr[4] != nil
    hct = arr[4].to_f
  else
    hct = nil  
  end
  if arr[5] != nil
    skt = arr[5].to_f
  else
    skt = nil  
  end
  
  Datum.create(Date: Date.strptime(arr[0], '%m/%d/%Y'), US_Actual: us_actual, Unchecked: unchecked, Italy_Trajectory: it, Hubei_China_Trajectory: hct, South_Korea_Trajectory: skt)
end