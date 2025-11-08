module Main (main) where

import Board
import System.Random (getStdGen, setStdGen)

main :: IO ()
main = getStdGen >>= printBoard . fst . generateBoard
