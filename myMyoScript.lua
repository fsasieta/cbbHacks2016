scriptId = 'com.github.franconoahjames.myfirstscript'  
scriptTitle = "My First Script"  
scriptDetailsUrl = "myo market first add"

function onForegroundWindowChange(app, title)  
        myo.debug("onForegroundWindowChange: " .. app .. ", " .. title)
        myo.debug("works!")
        return true
    end