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
		name: 'The Car',
		tag: 'moveable',
		street: '1521-1599 Ocean Front Walk',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90401',
		created_by: users.first.id.to_s,
		is_approved: true
	},
	{
		name: "Paul's Fave Lunch Spot",
		tag: 'delicious',
		street: '1540 2nd St',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90401',
		created_by: users.first.id.to_s,
		is_approved: true
	},
	{
		name: "Kelsey's Carousel",
		tag: 'magical',
		street: '200 Santa Monica Pier',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90401',
		created_by: users.first.id.to_s,
		is_approved: true
	},
	{
		name: "Feet Burner",
		tag: 'triumphant',
		street: '1670 Ocean Front Walk',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90401',
		created_by: users.last.id.to_s,
		is_approved: true
	},
	{
		name: "ShopHouse",
		tag: 'barfy',
		street: '1401 3rd Street Promenade',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90401',
		created_by: users.last.id.to_s,
		is_approved: true
	},
	{
		name: "Home",
		tag: 'homey',
		street: '1520 2nd St',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90401',
		created_by: users.last.id.to_s,
		is_approved: true
	},
	{
		name: "Rash City",
		tag: 'nasty',
		street: '401 Santa Monica Pier',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90401',
		created_by: users.last.id.to_s,
		is_approved: true
	},
	{
		name: "Bottomless Guac Belly",
		tag: 'delicious',
		street: '395 Santa Monica Blvd',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90401',
		created_by: users.last.id.to_s,
		is_approved: true
	},
	{
		name: "Where's Ryan?",
		tag: 'delicious',
		street: '839 North Edgemont Street',
		city: 'Los Angeles',
		state: 'CA',
		zip: '90029',
		created_by: users.last.id.to_s,
		is_approved: true
	},
	{
		name: "Jason Mraz-a-thon",
		tag: 'singy',
		street: '2130 Sawtelle Blvd #101',
		city: 'Los Angeles',
		state: 'CA',
		zip: '90025',
		created_by: users.last.id.to_s,
		is_approved: true
	},
	{
		name: "Teleporter",
		tag: 'futuristic',
		street: '2712 Santa Monica Blvd',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90404',
		created_by: users.last.id.to_s,
		is_approved: true
	},
	{
		name: "House of Cucumber Rolls",
		tag: 'obscene',
		street: '1019 Manhattan Beach Blvd',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90266',
		created_by: users.last.id.to_s,
		is_approved: true
	},
	{
		name: "JSON Dance Hall",
		tag: 'obscene',
		street: '2640 Main St',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90405',
		created_by: users.last.id.to_s,
		is_approved: true
	},
	{
		name: "Don't Talk to Women About RSPEC!!!",
		tag: 'wisdom',
		street: '217 Broadway',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90401',
		created_by: users.last.id.to_s,
		is_approved: true
	},
	{
		name: "Christa's Abandoned Home",
		tag: 'british',
		street: '318 Santa Monica Blvd',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90401',
		created_by: users.last.id.to_s,
		is_approved: true
	},
	{
		name: "Crash Pad",
		tag: 'sleepy',
		street: '2025 Lincoln Blvd',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90405',
		created_by: users.last.id.to_s,
		is_approved: true
	},
	{
		name: "Anonie HQ",
		tag: 'secrety',
		street: '8448 Lincoln Blvd',
		city: 'Westchester',
		state: 'CA',
		zip: '90405',
		created_by: users.last.id.to_s,
		is_approved: true
	},
	{
		name: "Rockyland",
		tag: 'secrety',
		street: '1313 Disneyland Dr',
		city: 'Anaheim',
		state: 'CA',
		zip: '92802',
		created_by: users.last.id.to_s,
		is_approved: true
	},
	{
		name: "Andrew's Lunch Spot",
		tag: 'beany',
		street: '1218 3rd St',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90401',
		created_by: users.last.id.to_s,
		is_approved: true
	},
	{
		name: "Real Burritos",
		tag: 'beanier',
		street: '1315 3rd Street Promenade',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90401',
		created_by: users.last.id.to_s,
		is_approved: true
	},
	{
		name: "Free Samples",
		tag: 'yogurty',
		street: '304 Santa Monica Blvd',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90401',
		created_by: users.last.id.to_s,
		is_approved: true
	},
	{
		name: "Free Fancy Pizza",
		tag: 'yummy',
		street: '1207 4th St',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90401',
		created_by: users.last.id.to_s,
		is_approved: true
	},
	{
		name: "Fifteen Dollar Kale Salad",
		tag: 'yummy',
		street: '500 Wilshire Blvd',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90401',
		created_by: users.last.id.to_s,
		is_approved: true
	},
	{
		name: "Will's Camera Obscura",
		tag: 'recreation',
		street: '1450 Occean Ave.',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90401',
		created_by: users.first.id.to_s,
		is_approved: true
	},
	{
		name: "Callie's Weds Guinness",
		tag: 'not so secret',
		street: '116 Santa Monica Blvd',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90401',
		created_by: users.first.id.to_s,
		is_approved: true
	},
	{
		name: "Clarence's Wheels",
		tag: 'vroomy',
		street: '1725 Main St',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90401',
		created_by: users.first.id.to_s,
		is_approved: true
	},
	{
		name: "RIP Coworks",
		tag: 'sleek',
		street: '1450 2nd St',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90401',
		created_by: users.first.id.to_s,
		is_approved: true
	},
	{
		name: "Jen's Future Home",
		tag: 'creepy',
		street: '1933 Jefferson Dr',
		city: 'Pasadena',
		state: 'CA',
		zip: '91104',
		created_by: users.first.id.to_s,
		is_approved: true
	},
	{
		name: "Mer's Guilty Pleasure",
		tag: 'goth',
		street: '1600 Argyle Ave',
		city: 'Los Angeles',
		state: 'CA',
		zip: '90038',
		created_by: users.first.id.to_s,
		is_approved: true
	},
	{
		name: "Marclanta",
		tag: 'southern',
		street: '121 Baker St NW',
		city: 'Atlanta',
		state: 'GA',
		zip: '30313',
		created_by: users.first.id.to_s,
		is_approved: true
	},
	{
		name: "Jonny's Trend Watch",
		tag: 'stylin',
		street: '401 N Rodeo Dr',
		city: 'x',
		state: 'CA',
		zip: 'x',
		created_by: users.first.id.to_s,
		is_approved: true
	},
	{
		name: "Hannah's Cheese Emporium",
		tag: 'cheesey',
		street: '728 Montana Ave',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90403',
		created_by: users.first.id.to_s,
		is_approved: true
	},
	{
		name: "Lorin's Beautiful Blythe",
		tag: 'busted',
		street: '1871 E Hobsonway',
		city: 'Blythe',
		state: 'CA',
		zip: '92225',
		created_by: users.first.id.to_s,
		is_approved: true
	},
		{
		name: 'Magic Castle',
		tag: 'magical',
		street: '7001 Franklin Ave',
		city: 'Los Angeles',
		state: 'CA',
		zip: '90028',
		created_by: users.first.id.to_s,
		is_approved: false
	},	
	{
		name: 'Original Muscle Beach',
		tag: 'fitness',
		street: '7001 Franklin Ave',
		city: 'Los Angeles',
		state: 'CA',
		zip: '90028',
		created_by: users.first.id.to_s,
		is_approved: false
	},
	{
		name: 'The Museum of Flying',
		tag: 'museum',
		street: '3100 Airport Ave',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90405',
		created_by: users.first.id.to_s,
		is_approved: false
	},
	{
		name: 'Annenberg Community Beach House',
		tag: 'recreation',
		street: '415 Pacific Hwy',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90402',
		created_by: users.first.id.to_s,
		is_approved: false
	},
	{
		name: 'Aero Theater',
		tag: 'movies',
		street: '1328 Montana Ave',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90403',
		created_by: users.first.id.to_s,
		is_approved: false
	},
	{
		name: 'Bob Bakers Marionette Theater',
		tag: 'theater',
		street: '1345 W 1st St',
		city: 'Los Angeles',
		state: 'CA',
		zip: '90026',
		created_by: users.first.id.to_s,
		is_approved: false
	},
	{
		name: 'International Chess Park',
		tag: 'recreation',
		street: '1647 Ocean Front Walk',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90401',
		created_by: users[1].id.to_s,
		is_approved: false
	},
	{
		name: 'Santa Monica Looff Hippodrome',
		tag: 'recreation',
		street: '200 Santa Monica Pier',
		city: 'Santa Monica',
		state: 'CA',
		zip: '90401',
		created_by: users[1].id.to_s,
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
