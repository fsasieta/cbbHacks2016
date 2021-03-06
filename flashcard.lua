scriptId = 'com.github.franconoahjames.mysecondscript'
scriptDetailsUrl = '' -- We don't have this until b/c we havent
		      -- submitted to the myo market.
scriptTitle = 'Flashcard Test'
startWebpage = false

function onForegroundWindowChange(app, title)
    local uppercaseApp = string.upper(app)
    myo.debug("onForegroundWindowChange: " .. app .. ", " .. title)
    myo.debug("works! ok")
    --return platform == "MacOS" and app == "Chrome.app" or
    --    platform == "Windows" and (uppercaseApp == "CHROME.EXE")
    -- If only testing or dont know app's name, just return true
     return true
end

function activeAppName()
    --return "Chrome"
    -- If only testing with any app, return true
     return true
end

function onUnlock()  
    myo.unlock("hold")
    myo.controlMouse(true)
    myo.debug("you are now controlling the mouse")
end


-- Flag to de/activate shuttling feature
supportShuttle = false

-- Effects

function forward()
    myo.keyboard("right_arrow", "press")
end

function backward()
    myo.keyboard("left_arrow", "press")
end

function upward()
    myo.keyboard("up_arrow","press")
end

function downward()
    myo.keyboard("down_arrow", "press")
end

function click()
    myo.mouse("left", "click")
end

function disableMouse()
    myo.controlMouse(false)
end


-- Helpers

function conditionallySwapWave(pose)
    if myo.getArm() == "left" then
        if pose == "waveIn" then
            pose = "waveOut"
        elseif pose == "waveOut" then
            pose = "waveIn"
        end
    end
    return pose
end

-- Shuttle

function shuttleBurst()
    if shuttleDirection == "forward" then
        forward()
    elseif shuttleDirection == "backward" then
        backward()
    end
end

-- Triggers

function onPoseEdge(pose, edge)
    -- Forward/backward and shuttle
    if pose == "waveIn" or pose == "waveOut" then
        local now = myo.getTimeMilliseconds()

        if edge == "on" then
            -- Deal with direction and arm
            pose = conditionallySwapWave(pose)

            if pose == "waveIn" then
                shuttleDirection = "backward"
            else
                shuttleDirection = "forward"
            end

            -- Extend unlock and notify user
            myo.unlock("hold")
            myo.notifyUserAction()

            -- Initial burst
            shuttleBurst()
            shuttleSince = now
            shuttleTimeout = SHUTTLE_CONTINUOUS_TIMEOUT
        end
        if edge == "off" then
            myo.unlock("timed")
            shuttleTimeout = nil
        end
    end
    if pose == "fist" then
	--if edge == "on" then
        
	    -- Extend unlock and notify user
            -- myo.unlock("hold")
            -- myo.notifyUserAction()
            
        -- Actual action.
	    myo.debug("Value of edge: " .. edge)
        click()
	--end
        myo.debug("Value of edge: " .. edge)

	--if edge == "off" then
            -- myo.unlock("timed")
            -- shuttleTimeout = nil
	--end
    end
    if pose == "fingersSpread" then
        disableMouse()
    end
end

-- All timeouts in milliseconds
SHUTTLE_CONTINUOUS_TIMEOUT = 2000
SHUTTLE_CONTINUOUS_PERIOD = 300

-- TODO: change the website to our website name
--
function onPeriodic()
    local now = myo.getTimeMilliseconds()
    

    if supportShuttle and shuttleTimeout then
        if (now - shuttleSince) > shuttleTimeout then
            shuttleBurst()
            shuttleTimeout = SHUTTLE_CONTINUOUS_PERIOD
            shuttleSince = now
        end
    end
end
