# Usage for scrapers

First thing to do: finding or creating a new `Bookmaker` specified by its name:
	bookie = Bookmaker.find_or_create("bookie_name")

While scraping games, you need to find or create the corresponding `BookieGame`:
	bookie_game = BookieGame.find_or_initialize_by_bookmaker_id_and_home_and_away(bookie.id, "LA Lakers", "Pittsburgh") do |g|
  		g.sport = "Football"
  		g.league = "NFL"
	end
	
Now, `bookie_game` has to be connected to `bookie`:
	bookie.bookie_games.push(bookie_game)
	
Odds can be added to `bookie_game` by:
	bookie_game.odds_