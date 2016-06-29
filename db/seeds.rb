# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
roles = Role.create( [{name: "user", description: "Can read an comment on articles, diaries, create forum, groups etc"}, {name: "staff", description: "Can manage articles, edit diaries etc."}, name: "admin", description: "Can manage any resource"}])
categories = Category.create(	[{ name: "Parenting" }, { name: "Living"}] )
Subcategory.create([
	{ name: "Trying to conceive", category:categories.first },
	{ name: "Pregnancy", category: categories.first },
	{ name: "Baby", category: categories.first },
	{ name: "Toddler", category: categories.first },
	{ name: "Pre-schooler", category: categories.first },
	{ name: "Big kids", category: categories.first },
	{ name: "Pre-teen", category: categories.first },
	{ name: "Teen", category: categories.first },
	{ name: "Young adults", category: categories.first },
	{ name: "Empty nest", category: categories.first },
	{ name: "Grandparents", category: categories.first },
	{	name: "Food", category: categories.second },
	{ name: "Health/Wellbeing", category: categories.second },
	{ name: "Décor", category: categories.second },
	{ name: "Money", category: categories.second},
	{ name: "Fun", category: categories.second },
	{ name: "Fashion", category: categories.second },
	{ name: "Beauty", category: categories.second },
	{ name: "Fitness", category: categories.second },
	{ name: "Sex & Relationships", category: categories.second },
	{ name: "Reviews", category: categories.second }

])

