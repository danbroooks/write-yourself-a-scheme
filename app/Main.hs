module Main where

import System.Environment
import Text.ParserCombinators.Parsec hiding (spaces)

symbol :: Parser Char
symbol = oneOf "!$%&|*+-/:<=?>@^_~#"

readExpr :: String -> String
readExpr input =
  case parse symbol "lisp" input of
    Left err -> "No match: " ++ show err
    Right val -> "Found value"

main :: IO ()
main = do
  args <- getArgs
  case args of
      "greet" : name : _ ->
        putStrLn $ "Hello, " ++ name

      "sum_two" : a : b : _ ->
        putStrLn $ "Result: " ++ show (read a + read b)

      "ask" : _ -> do
        putStrLn "What is your name?"
        name <- getLine
        putStrLn $ "Hello, " ++ name

      _ ->
        putStrLn "Unknown command"
