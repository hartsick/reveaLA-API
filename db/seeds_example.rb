# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
	{
		username: 'testuser',
		email: 'test@user.com',
		password: 'testpassword',
		password_confirmation: 'testpassword',
		name: 'Test User',
		is_admin: false
	},
	{
		username: 'master',
		email: 'master@user.com',
		password: 'masterpassword',
		password_confirmation: 'masterpassword',
		name: 'Master User',
		is_admin: true
	}
	])

Spot.create([
	{
		name: 'Magic Castle',
		tag: 'magical',
		street: '7001 Franklin Ave',
		city: 'Los Angeles',
		state: 'CA',
		zip: '90028',
		created_by: users.first.id.to_s,
		is_approved: true
	},	
	{
		name: 'Original Muscle Beach',
		tag: 'fitness',
		street: '7001 Franklin Ave',
		city: 'Los Angeles',
		state: 'CA',
		zip: '90028',
		created_by: users.first.id.to_s,
		is_approved: true
	},
	{
		name: 'The Museum of Flying',
		tag: 'museum',
		street: '3100 Airport Ave',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90405',
		created_by: users.first.id.to_s,
		is_approved: true
	},
	{
		name: 'Annenberg Community Beach House',
		tag: 'recreation',
		street: '415 Pacific Hwy',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90402',
		created_by: users.first.id.to_s,
		is_approved: true
	},
	{
		name: 'Aero Theater',
		tag: 'movies',
		street: '1328 Montana Ave',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90403',
		created_by: users.first.id.to_s,
		is_approved: true
	},
	{
		name: 'Bob Bakers Marionette Theater',
		tag: 'theater',
		street: '1345 W 1st St',
		city: 'Los Angeles',
		state: 'CA',
		zip: '90026',
		created_by: users.first.id.to_s,
		is_approved: true
	},
	{
		name: 'International Chess Park',
		tag: 'recreation',
		street: '1647 Ocean Front Walk',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90401',
		created_by: users[1].id.to_s,
		is_approved: true
	},
	{
		name: 'Santa Monica Looff Hippodrome',
		tag: 'recreation',
		street: '200 Santa Monica Pier',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90401',
		created_by: users[1].id.to_s,
		is_approved: true
	},
	{
		name: 'Camera Obscura',
		tag: 'recreation',
		street: '1450 Occean Ave.',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90401',
		created_by: users.first.id.to_s,
		is_approved: false
	},
	{
		name: 'The Galley',
		tag: 'food',
		street: '2442 Main St',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90405',
		created_by: users.first.id.to_s,
		is_approved: false
	},
	{
		name: 'Santa Monica Stairs',
		tag: 'fitness',
		street: '4th St & Adelaide Dr',
		city: 'Los Angeles',
		state: 'CA',
		zip: '90402',
		created_by: users[1].id.to_s,
		is_approved: false
	}
	])
