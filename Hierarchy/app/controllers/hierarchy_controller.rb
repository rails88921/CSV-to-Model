class HierarchyController < ApplicationController
  
  def run
  	require 'csv'
	csv = "#{Rails.root}/lib/assets/list.csv"
	CSV.foreach(csv, headers: true) do |row|
		name = row.to_s.scan(/\w+/).join(' ')
		sn = name.split(" ")
		if sn.length == 1
			p = Parent.create(name:name)
			p.save
		end
		if sn.length > 1
			c = p.children.build(name:name)
			c.save
		end
	end
  end
end
