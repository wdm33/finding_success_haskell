module Main (main) where

import Data.Char

main :: IO ()
main = 
  do
    putStrLn "Please enter a password\n> "
    password <- getLine
    print (validatePasswordm password)



checkPasswordLength :: String -> Maybe String
checkPasswordLength xs =
  case (length xs > 20) || (length xs < 10) of
    True -> Nothing
    False -> Just xs 

requireAlphaNum :: String -> Maybe String
requireAlphaNum xs =
  case (all isAlphaNum xs) of
    False -> Nothing
    True -> Just xs 
-- page 43

cleanWhitespace :: String -> Maybe String
cleanWhitespace "" = Nothing
cleanWhitespace (x : xs) =
  case (isSpace x) of 
    True -> cleanWhitespace xs
    False -> Just (x : xs)

--validPassword :: String -> Maybe String
validatePassword xs =
  case (cleanWhitespace xs) of
    Nothing -> "invalid whitespace" 
    Just xs -> 
      case (requireAlphaNum xs) of
        Nothing -> "invalid alphaNum"
        Just xs -> 
          case (checkPasswordLength xs) of
            Nothing -> "invalid length"
            Just xs -> xs



{-Chapter 4-}


validatePasswordm :: String -> Maybe String
validatePasswordm xs =
  cleanWhitespace xs
    >>= requireAlphaNum
    >>= checkPasswordLength

{-Page 62-}

reverseLine :: IO ()
reverseLine = getLine >>= (print . reverse)

reverseLinem =
  do
    x <- getLine
    print $ reverse x

{-continue with page 63 exercise 11 -}    

{-Chapter 5 -}



checkPasswordLength2 :: String -> Either String String
checkPasswordLength2 password =
  case (length password > 20) of
    True -> Left "Your password cannot be longer \
                  \than 20 characters."
    False -> Right password


requireAlphaNum2 :: String -> Either String String
requireAlphaNum2 xs =
  case (all isAlphaNum xs) of
    False -> Left "Your password is not \
                  \alphnumeric."
    True -> Right xs 

cleanWhitespace2 :: String -> Either String String
cleanWhitespace2 "" = Left "Not clean, Not clean!" 
cleanWhitespace2 (x : xs) =
  case (isSpace x) of 
    True -> cleanWhitespace2 xs
    False -> Right (x : xs)

validatePassword2 :: String -> Either String String
validatePassword2 password =
  cleanWhitespace2 password
    >>= requireAlphaNum2
    >>= checkPasswordLength2

printTestResult :: Either String () -> IO ()
printTestResult r =
  case r of
    Left err -> putStrLn err
    Right () -> putStrLn "All tests passed."

eq :: (Eq a, Show a) => Int -> a -> a -> Either String ()
eq n actual expected =
  case (actual == expected ) of
    True -> Right ()
    False -> Left (unlines
      [ "Test " ++ show n
      , " Expected: " ++ show expected
      , " But got:  " ++ show actual
      ])

test :: IO ()
test = printTestResult $
  do
    eq 1 (checkPasswordLength2 "")(Right "")
    eq 2 (checkPasswordLength2 "julielovesbooks")(Right "julielovesbooks")
    eq 3 (checkPasswordLength2 "julielovesbooks")(Right "julielovesbooks")


