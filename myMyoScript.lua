--require "os"
scriptId = 'com.github.franconoahjames.myfirstscript'  
scriptTitle = "My First Script"  
scriptDetailsUrl = "myo market first add"

function onForegroundWindowChange(app, title)  
        myo.debug(" Basic onForegroundWindowChange: " .. app .. ", " .. title)
        myo.debug("works!")
	myo.debug("works didly do!")
	--os.execute("start chrome www.facebook.com")
	--myo.debug("just used the os execute command in lua")
		myo.controlMouse(true)
        return true
    end
