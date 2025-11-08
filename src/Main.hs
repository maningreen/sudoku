module Main (main) where

import Board
import System.Random (getStdGen, setStdGen)

main :: IO ()
main = do 
  getStdGen >>= printBoard . fst . generateBoard
