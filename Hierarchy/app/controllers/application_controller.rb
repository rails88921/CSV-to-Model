class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end








require 'csv'
csv = "#{Rails.root}/lib/assets/1.csv"
CSV.foreach(csv, headers: true) do |row|
	name = row.to_s.scan(/\w+/).join(' ')
	sn = name.split(" ")
	if sn.length == 1
		p = Parent.create(name:name)
		p.save
	end
	c = p.children.build(name:name)
	c.save
end