module Main where

import System.Environment ( getArgs )
import Data.Map.Lazy as LazyMap ()
import System.Exit ( exitFailure )
import Chococino.Par ( pProgram, myLexer )
import System.IO ( stderr, debug, hPutStrLn )

--type Loc = Int
--type Env = LazyMap.Map Ident Loc
--type Store = LazyMap.Map Loc Value

main :: IO ()
main = do
  args <- getArgs
  case args of
    [] -> putStrLn "Please specify a file for execution"
    (x:xs) ->
      if not (Prelude.null xs)
        then putStrLn "Only one file can be executed"
      else do
        code <- readFile x
        case pProgram $ myLexer code of
          Left message -> do
            hPutStrLn stderr message
            exitFailure
          Right parseTree -> do
            output <- interpret parseTree
            case output of 
              Left message -> hPutStrLn stderr message
              Right exitCode -> do
                if exitCode != 0
                  then hPutStrLn stderr $ "Exit code: " ++ exitCode
                else
                  exitSuccess


