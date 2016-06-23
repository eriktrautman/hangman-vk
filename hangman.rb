require 'sinatra'
require 'sinatra/reloader'

#ruby hangman.rb -o $IP -p $PORT



$message = ""
$word = ""
$word_display = ""
$points_needed = 0



def get_difficulty_and_start (desired_word_length)
    dwl_int = desired_word_length.to_i
    
    possible_words = []
    
    
    somefile = File.open("enable.txt", "r")
    
    
    one = somefile.read
    two = one.scan(/\b\w+\b/)
    
    two.each do |word| 
    	wl = word.length
    	
    	if wl == dwl_int
    	    possible_words.push(word)
    	end
    end
        
    somefile.close
    
    return possible_words[rand(possible_words.length)]
end

$count = 0

$animation_num = 0

$message = ''
$guessed_right = []
$guessed_wrong = []
$won = false
$guesses_left = 5



def check_guess(guess)
    puts ("GUESS --> #{guess}")
    guess = guess.downcase
    guess_array = $word.split("")

    if ($word.include? guess) && (($guessed_right.include? guess) == false)
    $guessed_right.push(guess)
    $message = "There is a #{guess}!" 
    $points_needed -= 1
    
    elsif ($guessed_right.include? guess) == true
        $message = "You already found a #{guess}!"
        
    elsif ($guessed_wrong.include? guess) == true
        $message = "You already tried guessing a #{guess}, but no worries - I won't count it against you!"        
        
    else
        if ($guessed_wrong.include? guess) == false
        $guessed_wrong.push(guess)
        end
        
        $guesses_left -= 1
        $message = "There is no #{guess}!"
        
        
        if $won != true
        $animation_num += 1
        end
    end
    
    
    
    n = guess_array.map { |x|
        if $guessed_right.include? x
            x = x
        else
            x = '_'
        end
    }
    

    return n.join(" ")

end

def get_points_needed(word)
    temp = []
    
    word.split("").each do |w|
    if (temp.include? w) == false
        temp.push(w)
    end
    end
    return temp.length
end

def reset_game
    $ss = "inline-block"
    $gs = "none"
    $start = false
    
    $start_guess = false
    
    $word = ""
    # $word_display = ""
    $points_needed = 0 
    
    $count = 0

    # $animation_num = 0
    
    
    $guessed_right = []
    $guessed_wrong = []
    $won = false
    $guesses_left = 5
    
    $start = false

    $start_guess = false
end   




$ss = "inline-block"
$gs = "none"
$start = false

$start_guess = false



get '/' do ####################################################################################### =>

if $start

if params["start-new"] && (params["start-new"].length > 0 && (params["start-new"].to_i > 1) && (params["start-new"].to_i < 29))
SN = params["start-new"]
$word = get_difficulty_and_start (SN)
puts "THE WORD IS #{$word}"
$word_display = ('_' * $word.length).split("").join(" ")
$points_needed = get_points_needed ($word)

$message = "Good luck. You got this!"

$ss = "none"
$gs = "inline-block"


$start = false
$start_guess = true
$animation_num = 0

else
    $message = "Try entering something more reasonable. :-)"
end


elsif $start_guess

    if params["guess-box"] && (params["guess-box"].length > 0)
    $word_display = check_guess(params["guess-box"])
    puts "word_display #{$word_display}"
    end
    
    if $points_needed == 0
        $message = "You Won! But can you keep the streak alive?"
        $gs = "none"
        $animation_num = 22
        reset_game
        
    
    elsif $guesses_left < 1
        $message = "YOU LOST! But it was a fluke I'm sure. Try again!"
        $word_display = $word.split("").join(" ")
        $gs = "none"
        reset_game
        
    end
    




    
end

if $count == 0
    $start = true
end

$count += 1


erb :index, :locals => {:the_word => $word, :word_display => $word_display, :start_section => $ss, :guess_section => $gs, :animation_num => $animation_num, :message => $message, :guessed_wrong => $guessed_wrong } 
end

