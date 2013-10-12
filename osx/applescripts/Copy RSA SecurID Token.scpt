set appName to "SecurID"
set thePin to RsaTokenPin()

-- launch the app
launch application appName

-- type the pin and copy the token
tell application appName
  activate
  tell application "System Events"
    keystroke thePin -- type the pin number
    key code 36 -- return key
    delay 0.3 -- wait for token appear
    key code 48 -- press tab
    key code 49 -- space (to hit the copy button)
  end tell
end tell

-- go back to Chrome as fast as we can.
activate application "Google Chrome"

-- hide SecurID
tell application "Finder"
  set visible of process appName to false
end tell

-- and now quit SecurID
quit application appName

-- Add an entry to the Mac OS X keychain through the "Keychain Access" utility
-- The keychain item name must be "rsatoken", the account name anything you
-- want, and the password is your PIN for the RSA token.
on RsaTokenPin()
  return (do shell script "security -q find-generic-password -gl rsatoken 2>&1  | egrep '^password' | awk -F\\\" '{print $2}'")
end RsaTokenPin
