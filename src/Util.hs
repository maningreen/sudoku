module Util where
import System.Random (StdGen)

mapFst :: (a -> b) -> (a, c) -> (b, c)
mapFst f (a, b) = (f a, b)

mapSnd :: (b -> c) -> (a, b) -> (a, c)
mapSnd f (a, b) = (a, f b)

genInfinite :: (StdGen -> (a, StdGen)) -> StdGen -> [a]
genInfinite f gen = x : genInfinite f nextGen
  where
    (x, nextGen) = f gen

replicateGen :: Int -> (StdGen -> (a ,StdGen)) -> StdGen -> ([a], StdGen)
replicateGen 0 _ gen = ([], gen)
replicateGen count f gen = mapFst (x:) $ replicateGen (count - 1) f nextGen 
  where
    (x, nextGen) = f gen
