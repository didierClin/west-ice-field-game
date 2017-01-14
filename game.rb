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

zones = { ice_field: "" , bridge: "" , snow_house: "" }


# Dana
dice  = ["bridge","snow_house","ice_cube","bridge","snow_house","ice_cube"]



# The dice
# Dice roll
puts dice_roll


# John
#created 4 pawns in the shape of animals
pawns =[{"rabbit"=>depart}, {"auk"=>depart},{"fox"=>depart},{"bear"=>depart}]



# Didier
# Create bridge with 6 pilar
bridge = 6





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
