# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require 'date'


foo = CSV.read("COVID-Projections--US_Population-Scaled--SKorea_ChinaHubei_Italy--LogisticModels--2020_04_27.csv")

foo.drop(2).each do |arr|
  if arr[1] != nil
    cases = arr[1].to_i
  else
    cases = nil  
  end
  if arr[2] != nil
    gompertz = arr[2].to_f
  else
    gompertz = nil
  end
  if arr[3] != nil
    new_cases = arr[3].to_f
  else
    new_cases = nil  
  end
  if arr[4] != nil
    italy = arr[4].to_f
  else
    italy = nil  
  end
  if arr[5] != nil
    germany = arr[5].to_f
  else
    germany = nil  
  end
  if arr[6] != nil
    spain = arr[6].to_f
  else
    spain = nil  
  end
  
  Datum.create(Date: Date.strptime(arr[0], '%m/%d/%Y'), Cases: cases, Gompertz: gompertz, New_Cases: new_cases, Italy_Trajectory: italy, Germany_Trajectory: germany, Spain_Trajectory: spain)
end