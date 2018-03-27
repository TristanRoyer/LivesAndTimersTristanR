--Title: Lives&Timers
--Name: Tristan Royer
--Course: Ics2O/3C
--

-- variables for the timer
local totalSeconds = 5
local secondsLeft = 5
local clockText
local countDownTimer

local lives = 3
local heart1
local heart2

local incorrectObject
local pointsObject
local pointsObject
local GameOver = displayNewRect("Images/gameOver.png",1000,1000)
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

    if (lives == 0) then
    	--play  sounds

         
        --show image
        gameOver.isVisible = true

    if (lives == 2) then
    	heart2.isVisible = false
    	elseif (lives == 1) then
    	heart1.isVisible = false
    end

    --**** calll the function to ask a new question

   end 

end

--function that calls the timer
local function StartTimer(
	-- create a countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay( 100, UpdateTimer, 0 )
end

----------------------------------------------
-- OBJECT CREATION
----------------------------------------------

-- create the lives to display on the screen
heart1 = display.newImageRect("Images/heart.png", 100,100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("images/heart.png", 100, 100)
heart2.x =  display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7