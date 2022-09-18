


function :: Integer -> Integer -> Integer
function x y = if (x > y) then (x + 10) else y

function2 :: Integer -> Integer -> Integer
function2 x y = 
  case (x > y) of
    False -> y
    True -> x + 10

absVal :: (Num a, Ord a) => a -> a
absVal x = if (x <0) then (negate x) else x

absVal2 :: (Num a, Ord a) => a -> a
absVal2 x =
  case (x < 0) of
    False -> x 
    True -> (negate x)

validateUsernamePassword :: String -> String -> String
validateUsernamePassword username password =
  case (null username, null password) of 
    (False, False) -> "Okay"
    (False, True)  -> "Empty password"
    (True, False)  -> "Empty username"  
    (True, True)   -> "Empty username and password"



safeTail :: [a] -> Maybe [a]
safeTail maybe x = 
  Nothing -> putStrLn "nice error" 
  Just x -> x
  


















