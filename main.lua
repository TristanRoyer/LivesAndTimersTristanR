--Title: Lives&Timers
--Name: Tristan Royer
--Course: Ics2O/3C
--

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--sets the background colour
display.setDefault("background",124/255, 15/255,110/255)

-------------------------------------------------------------------------------
-- LOCAL VARIABLES
-------------------------------------------------------------------------------

-- create local variables
local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectObject
local randomOperation
local numericField
local score = 0
local scoreText

  


 -- create the incorrect text object and make it invisible
     incorrectObject = display.newText( "Incorrect", display.contentWidth/2, display.contentHeight*2/3,nil,50)
     incorrectObject.isVisible = false
     incorrectObject:setTextColor(100/255, 180/255, 19/255)

     --create the correct text object and make it invisible
     correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3,nil,50)
     correctObject.isVisible = false
     correctObject:setTextColor(180/255,120/255,100/255)
----------------------------------------------------------------------------
--LOCAL FUNCTIONS
----------------------------------------------------------------------------

local function AskQuestion()

    -- program chooses a random number betweer 1-4
      randomOperation = math.random(1,3)
    -- generate 2 random numbers between a max. and a min. number
    randomNumber1 = math.random(0,25)
    randomNumber2 = math.random(0,21)
    randomNumber3 = math.random(0,10)
    randomNumber4 = math.random(0,10)
    
    if ( randomOperation == 1) then correctAnswer = randomNumber1 + randomNumber2
     
     end

    --create question in text object
    questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "
    end

    if (randomOperation == 2) then correctAnswer = randomNumber1 - randomNumber2
    --create question in text object
    questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
     end

     if (  (correctAnswer < 0) and  (      )) then
        correctAnswer = randomNumber2 - randomNumber1
        questionObject.text = randomNumber2 .. " - " .. randomNumber1 .. " = "
   
end

if (randomOperation == 3) then correctAnswer = randomNumber3 * randomNumber4
    --create question in text object
    questionObject.text = randomNumber3 .. " * " .. randomNumber4 .. " = "
end



local function HideCorrect()
    correctObject.isVisible = false
    AskQuestion()
end

local function HideIncorrect()
    incorrectObject.isVisible = false
    AskQuestion()
end


local function NumericFieldListener( event )

    --User begins editing "numericField"
    if ( event.phase == "began" ) then

        --clear text field
        event.target.text = ""

        elseif event.phase == "submitted" then 
            --when the answer is submitted (enter key is pressed) set user input to user's answer
            userAnswer = tonumber(event.target.text)

            --if the users answer and the correct answer are the same:
            if (userAnswer == correctAnswer) then
                correctObject.isVisible = true
                timer.performWithDelay(1000,HideCorrect)
                else 
                incorrectObject.isVisible = true
                timer.performWithDelay(1000,HideIncorrect)
            end
            --clear text field
        event.target.text = ""
        end
    end

    local function ScoreUpdater( event )
            
            if (userAnswer == correctAnswer) then
                score = score + 1
            end

        
            

end
  


-- variables for the timer
local totalSeconds = 10
local secondsLeft = 10
local clockText
local countDownTimer

local lives = 4
local heart1
local heart2
local heart3
local heart4

local incorrectObject
local pointsObject
local pointsObject
local GameOver = display.newImageRect("Images/gameOver.png",1000,1000)
GameOver.isVisible = false

----------------------------------------
-- Local Functions
----------------------------------------

local function UpdateTime()

	-- decrement the number of seconds
	secondsLeft = secondsLeft - 1

	--display the number of seconds left in the clock object
	clockText.Text = secondsLeft .. ""

    if ( secondsLeft == 0 ) then 
    	-- reset the number of seconds left
    	secondsLeft = totalSeconds
    	lives = lives - 1

    end

    if (lives == 0) then
        heart4.isVisible = false 
        heart3.isVisible = false
        heart2.isVisible = false
        heart1.isVisible = false
        --show image
        gameOver.isVisible = true

end

    	--play  sounds
        local FreeMusic = audio.loadSound("Sounds/bensound-energy.mp3")
         local FreeMusicChannel
        FreeMusicChannel = audio.play(FreeMusic)

        
      
    if (lives == 4) then
    heart4.isVisible = true
    heart3.isVisible = true 
    heart2.isVisible = true
    heart1.isVisible = true   
    elseif (lives == 3) then
    heart4.isVisible = false 
    heart3.isVisible = true
    heart2.isVisible = true
    heart1.isVisible = true
    elseif (lives == 2) then
    heart4.isVisible = false
    heart3.isVisible = false
    heart2.isVisible = true
    heart1.isVisible = true
    elseif (lives == 1) then
    heart4.isVisible = false
    heart3.isVisible = false
    heart2.isVisible = false
    heart1.isVisible = true
    end

    end

--function that calls the timer
local function StartTimer()
	-- create a countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay( 100, UpdateTimer, 0 )
end

   -----------------------------------------------------------------
     -- OBJECT CREATION
     -----------------------------------------------------------------

     -- displays a question and sets the colour 
     questionObject = display.newText("", display.contentWidth/3, display.contentHeight/2, nil, 40)
     questionObject:setTextColor(155/255, 150/255, 100/255)

     

    
     -- Create Numeric field
     numericField = native.newTextField( 500, 350, 150, 30)
     numericField.inputType = "number"

    

     -- add the event listener for the numeric field
     numericField:addEventListener( "userInput", NumericFieldListener )
  
    -- add the event listener for the Score Board
     numericField:addEventListener( "userInput", ScoreUpdater )

     numericField:addEventListener("userInput", UpdateTime)

      

     ---------------------------------------------------------------------
     --FUNCTION CALLS
     ---------------------------------------------------------------------

     -- call the function to ask the question
     AskQuestion()

-- create the lives to display on the screen
heart1 = display.newImageRect("Images/heart.png", 100,100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("images/heart.png", 100, 100)
heart2.x =  display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7

heart3 = display.newImageRect("images/heart.png", 100, 100)
heart3.x =  display.contentWidth * 6 / 8
heart3.y = display.contentHeight * 1 / 7

heart4 = display.newImageRect("images/heart.png", 100, 100)
heart4.x =  display.contentWidth * 6 / 8
heart4.y = display.contentHeight * 1 / 7