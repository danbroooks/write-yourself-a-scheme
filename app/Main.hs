module Main where

import System.Environment

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
