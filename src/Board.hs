module Board (Item, Board, boardLength, genItem, generateColumn, generateBoard, printColumn, printBoard) where

import System.Random
import Util (replicateGen)
import Data.List (intercalate)

-- ##### TYPES ##### 

-- An item is numbered 1 - BoardLength
-- Any items outside of this range will bring undefined behavior
type Item = Word

-- A list of items defined with the length of boardLength
-- Any length of which isn't so, will provide undefined behavior
type Column = [Item]

-- All items follow the same rules that are in standard sudoku
-- Dimensions of board are defined by `boardLength`, which is interpreted as an Int
-- Allowing for a dynamic size of the board
type Board = [Column]

-- ##### CONSTANTS ##### 

boardLength :: Num a => a
boardLength = 9

-- ##### GENERATION ##### 

genItem :: StdGen -> (Item, StdGen)
genItem = randomR (1, boardLength)

generateColumn :: StdGen -> (Column, StdGen)
generateColumn = replicateGen boardLength genItem

generateBoard :: StdGen -> (Board, StdGen)
generateBoard = replicateGen boardLength generateColumn

-- ##### IO ####

printColumn :: Column -> IO ()
printColumn = mapM_ print

printBoard :: Board -> IO ()
printBoard xs 
  | null xs = pure ()
  | any null xs = pure ()
  | otherwise = putStrLn (intercalate " " (map (show . head) xs)) >> printBoard (map (drop 1) xs)
