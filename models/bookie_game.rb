class BookieGame < ActiveRecord::Base
  belongs_to :bookmaker
  belongs_to :game
  has_many :odds
  
  before_save :map
  
  private
    # uses the teamname class in order to map both teamnames contained in this class
    # and maps it to a game
    def map
      # lookup teams in teamname class
      # if already there, get instance
      # otherwise create and save new instance
      team1 = Teamname.find_or_create_by_name_and_bookmaker_id(self.team1, self.bookmaker_id)
      team2 = Teamname.find_or_create_by_name_and_bookmaker_id(self.team2, self.bookmaker_id)
      
      # map with game only when both teamnames are mapped
      # otherwise: leaves teammappings nil and gamemapping
      begin
        game = Game.find_or_create_by_team1_id_and_team2_id(team1.teamname_id, team2.teamname_id)
        self.game = game        
      end unless team2.team.nil? or team1.team.nil?
   
    end
end