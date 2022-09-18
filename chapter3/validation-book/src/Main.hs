module Main (main) where

import Data.Char

main :: IO ()
main = 
  do
    putStrLn "Please enter a password\n> "
    password <- getLine
    print (checkPasswordLength password)



checkPasswordLength :: String -> Maybe String
checkPasswordLength password =
  case (length password > 20) of
    True -> Nothing
    False -> Just password

requireAlphaNum :: String -> Maybe String
requireAlphaNum password =
  case (all isAlphaNum password) of
    False -> Nothing
    True -> Just password

-- page 43
