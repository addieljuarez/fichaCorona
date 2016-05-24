-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

local physics = require('physics')
physics.start( )


local base = display.newRect( 0, 400, 800, 1 )

physics.addBody( base, 'static', {friction= 0.3, bounce=0.3, density= 1.0} )


local ficha = display.newCircle( 200, 350, 40 )

physics.addBody( ficha, 'dynamic', {friction=0.3, density=1})



function ficha:touch( event )

	if event.phase == 'began' then
		display.getCurrentStage():setFocus( self )
		self.isFocus = true
		print( 'en began' )

	elseif self.isFocus then

		if event.phase == 'moved' then
			print( ' en moved' )
			self.markX = event.x
			self.markY = event.y

		elseif event.phase == 'ended' or event.phase == 'cancelled' then
			display.getCurrentStage( ):setFocus( ficha )
			-- self.isFocus = false
		end


	end
	
	-- if event.phase == 'moved' then

	-- 	ficha.x = event.x
	-- 	ficha.y = event.y
	-- end

	-- if event.phase == 'ended' then
	-- 	-- ficha.x = event.x
	-- 	-- ficha.y = event.y
	-- 	display.getCurrentStage( ):setFocus( ficha )
	-- 	self.isFocus = true
	-- end

	return true
end


ficha:addEventListener( 'touch', ficha )