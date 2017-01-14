#created 4 pawns in the shape of animals
# Sorry JR I change my point of view ;)
pawns =["rabbit", "auk", "fox" , "bear"]

# Thommy
#game board - master piece of program (for me ;) )
#change vars depart, pont and arriver (ee) to hash of zones
# zones = { depart pont arrivee }
#
# depart = "zone de pêche"
#
# #Pont
# pont = "transition"
#
# #Zone d'arriver
# arriver = "iglou"
# John

zones = { ice_field: [pawns[0],pawns[1],pawns[2],pawns[3]] , bridge: [] , snow_house: [] }


# Dana
dice  = ["bridge","snow_house","ice_cube","bridge","snow_house","ice_cube"]



# The dice
# Dice roll
# puts dice_roll


# Didier
# Create bridge with 6 pillar
bridge = 6


# many players but one team
puts "How many players in the team : ?"
team = []
(1..gets.to_i).each do |p|
  puts "What's your name player #{p}"
  team << gets.chomp
end




=begin
def dice_roll
    face= dice.sample

    if face=="bridge"
    puts "You just drew a #{face}! You can move forward"
    elsif face=="snow_house"
    puts "You just drew a #{face}! You're on the safe side!"
    elsif face=="ice_cube"
    puts " Outch!! You just drew an #{face}! You're sinking'"
    end

end




# Thommy
# End of game
def end_of_game bridge
    if bridge != 0
        puts "replay"
    else
        puts "game over"
    end
end

puts end_of_game 0

=end
