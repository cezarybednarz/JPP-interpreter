module Main where

import System.Environment ( getArgs )
import Data.Map.Lazy as LazyMap ()
import System.Exit ( exitFailure, exitSuccess )
import Chococino.Par ( pProgram, myLexer )
import System.IO ( stderr, hPutStrLn )
import Interpreter ( interpretProgram, Val(VInt) ) 

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
            output <- interpretProgram parseTree
            case output of 
              Left message -> hPutStrLn stderr message
              Right (VInt exitCode, _) -> do
                if exitCode /= 0
                  then hPutStrLn stderr $ "Error, exit code: " ++ show exitCode
                else
                  exitSuccess


