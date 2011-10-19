# fineline-CMS

This is fineline-CMS a super simple but mighty cms build on Ruby on Rails.

fineline is an GemSet, so it is fully modular.



## Usage

	load Gemfile
	
	$ bundle install
	
	$ rails g strangecms:install		# => will mirror all needed files, than migrate and seed database (production & development if needed)
	
	$ rails server						# => start your new CMS
	
	.. more usements:
	
	$ rails g strangecms:update			# => update system & all modules
	
	$ rails g strangecms:modul [name]	# => generates new modul [name]
	
	$ rails g strangecms:theme [name]	# => generates new theme [name]



## Code for this GEMset is inspired and adopted from following great stuff:
	Thanks to all of theese People, this app exists!
	THANKS A LOT !
Spree Commerce - Spree (Spree) - [Spree][Spree], [spreecommerce][spreecommerce]

Lucas Florio - lucasefe (themes_for_rails) - [lucasefe][lucasefe]

Gastón Ramos - gramos (easy-fckeditor) - [gramos][gramos]

Philip Hallstrom - phallstrom (el_finder) - [phallstrom][phallstrom]

Ryan Bates - ryanb (Railscasts) - [ryanb][ryanb], [railscasts][railscasts]



## Licence

	Private Repository ! .. no Copy! .. no Change! .. no Downloads! .. no Support!
	

[spree]: https://github.com/spree/spree
[spreecommerce]: http://spreecommerce.com/
[lucasefe]: https://github.com/lucasefe/themes_for_rails
[gramos]: https://github.com/gramos/easy-fckeditor
[phallstrom]: https://github.com/phallstrom/el_finder
[railscasts]: http://railscasts.com/
[ryanb]: https://github.com/ryanb/railscasts-episodes/