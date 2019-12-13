# Requires
require_relative "getFiles.rb"
getManyFiles(["classes"])

# Pre-Initializations
$game = Game.new
$v = "Snow 0.1"

# Game Loop
loop do

  # Pre-Menu Draw
  $game.clearScreen
  $game.clearActions

  # Menu Draw
  if $game.menu == "main"
    puts "Example Main Menu"
    $game.newAction("Example Option 1", "eo1")
    $game.newAction("Example Option 2", "eo2")
    $game.newAction("Example Quit Game", "quit1")
  elsif $game.menu == "eo1"
    puts "Welcome to Example Menu 1!"
    $game.newAction("Go Back", "main")
    $game.newAction("Go to Example Menu 2", "eo2")
  elsif $game.menu == "eo2"
    puts "Welcome to Example Menu 2!"
    $game.newAction("Go Back", "main")
    $game.newAction("Go to Example Menu 1", "eo1")
    $game.newAction("Cause an Error", "there is no option for this")
  elsif $game.menu == "quit1"
    puts "Are you sure you want to quit?"
    $game.newAction("No", "main")
    $game.newAction("Yes", "quit2")
  elsif $game.menu == "quit2"
    break
  else
    puts "An error occured. You landed on a menu that does not exist."
    puts "I am trying to find the '#{$game.menu}' menu."
  end

  # Post-Menu Selections
  puts ""
  n = 0
  $game.actions.each do |action|
    puts "(#{n + 1}) #{action.name}"
    n += 1
  end

  if n > 0
    print "\n>> "
    input = gets.chomp.to_i

    if input > 0 and input <= $game.actions.count
      $game.menu = $game.actions[input - 1].dest
    else
      print "Invalid selection.\nPress 'enter' to continue.\n> "
    end
  else
    print "Press 'enter' to continue.\n> "
    gets
  end

end
