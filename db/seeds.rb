# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

spots = Spot.create([
	{
		name: 'Magic Castle',
		tag: 'magical',
		street: '7001 Franklin Ave',
		city: 'Los Angeles',
		state: 'CA',
		zip: '90028'
		created_by: 1,
		is_approved: true
	},	
	{
		name: 'Abandoned Lion Cages',
		tag: 'magical',
		street: '7001 Franklin Ave',
		city: 'Los Angeles',
		state: 'CA',
		zip: '90028'
		created_by: 1,
		is_approved: true
	}
	])
