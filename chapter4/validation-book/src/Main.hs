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


