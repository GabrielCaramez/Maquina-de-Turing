{- |
Module      :  TuringTape
Description :  Module that implements a Tape for a Turing Machine as a ListZipper.
Copyright   :
License     :

The Tape for a TuringMachine is implemented as a ListZipper. This gives us O(1) operations on the list.

The cursor of the ListZipper is the current cell being read by the TuringMachine. 
The TuringMachine can then move the cursor left or right and write to the current cell.
-}
module TuringTape where

import qualified Data.Set as Set

-- | Tape of a 'TM' as a ListZipper.
-- The lists on the left and right of the cursor represents the entire tape.
-- The cursor in the center is the current cell of the tape.
data TuringTape a = T [a] a [a]

-- | Print the TuringTape in the right order as internally the lists are in a slightly different order.
instance (Show a) => Show (TuringTape a) where
    show (T ls x right) = show (left ++ [x]++ right)
        where
            left = reverse ls

-- | Moves the tape cursor left.
tapeLeft :: TuringTape a -- ^ Tape to move.
         -> TuringTape a -- ^ Returns the moved tape.
tapeLeft (T [] x rs)        = T [] x rs
tapeLeft (T (l:ls) x rs)    = T ls l (x:rs)
tapeLeft _                  = error "Left move"

-- | Moves the tape cursor right.
tapeRight :: TuringTape a -- ^ Tape to move.
          -> a            -- ^ Default value if we have reached the end of the tape.
          -> TuringTape a -- ^ Returns the moved tape.
tapeRight (T ls x []) y     = T (x:ls) y []
tapeRight (T ls x (r:rs)) _	= T (x:ls) r rs
tapeRight _ _               = error "Right move"

-- | Outputs the value of the current cell the cursor points at.
currentCell :: TuringTape a -> a
currentCell (T _ x _ ) = x

-- | Overwrites the value of the current cell the cursor points at.
writeToCell :: TuringTape a -- ^ Tape to write over.
            -> a            -- ^ Value to write.
            -> TuringTape a -- ^ Returns the tape with the value written over it.
writeToCell (T ls _ rs) x = T ls x rs

-- | Initialises a TuringTape.
initTape :: Ord a => [a]                  -- ^ List of values to store in the TuringTape.
                  -> Set.Set a            -- ^ TapeAlphabet where all values must be a part of.
                  -> Maybe (TuringTape a) -- ^ Returns Nothing if a value in the list does not belong to the TapeAlphabet. Just TuringTape otherwise.
initTape (c:cs) alphabet 
    | length (filter (\x -> Set.member x alphabet) (c:cs)) == 0 = Nothing
    | otherwise                                                 = Just $ T [] c cs