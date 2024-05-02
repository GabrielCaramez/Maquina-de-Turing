{- |
Module      :  TuringMachine
Description :  A Turing Machine implementation.
Copyright   :
License     :

Defines all data structures used to create the TuringMachine such as the tape and transition functions. 
-}
module TuringMachine where

import qualified Data.Map as Map
import qualified Data.List as List
import qualified Data.Set as Set
import Data.Maybe

import TuringTape

import Debug.Trace

-- | Names of each state of the machine.
type State = String


-- | Represents a movement on the tape.
data Move = L -- ^ Move left on the tape.
          | R -- ^ Move right on the tape.
	deriving (Show, Eq)

-- | Data values that are in each cell of the tape.
data Cell = Cell String -- ^ A 'String' representation of an input symbol.
          | Blank       -- ^ For the blank symbol "_".
    deriving (Eq, Ord)

-- | Removes Cell when printing for cleaner printing.
instance Show Cell where
  show (Cell a) = show a
  show Blank    = "_"

-- | Uses a 'Set' to get a unique alphabet for the 'TuringTape'
type TapeAlphabet = (Set.Set Cell)

-- | Instance of 'TuringTape' using 'Cell's as the values stored in the tape.
type TMTape = (TuringTape Cell)

-- | Instance of a 'TuringMachine'.
data TM = TM { currState :: State        -- ^ Current 'State' of the machine.
             , alphabet  :: TapeAlphabet -- ^ Alphabet that this machine reads.
             , qa        :: [State]      -- ^ The accepting 'State'.
             , qr        :: [State]      -- ^ The rejecting 'State'.
             , delta     :: [Transition] -- ^ List of 'Transition's which represent the transition table.
             }
    deriving (Show)

-- | A single case of the transition function of the machine.
data Transition = Transition { inState    :: State -- ^ Input 'State', current state of the machine.
                             , inSymbol   :: Cell  -- ^ Input symbol, current value the cursor of the tape is pointing at.
                             , outState   :: State -- ^ Output 'State' for the next current state.
                             , outSymbol  :: Cell  -- ^ Output symbol to write to the current cell of the tape.
                             , outMove    :: Move  -- ^ Output 'Move' for which direction to go along on the tape.
                             }
    deriving (Show)

-- | Runs a 'TM' on a 'TuringTape'.
run :: TM -> TMTape -> Maybe TMTape
run tm tp = step tm tp 0

-- | Each step of the 'TM', applying the 'Transition' function based on the current symbol in the 'TuringTape' and the current 'State'
step :: TM           -- ^ Current iteration of the machine in its currState.
     -> TMTape       -- ^ Tape that the machine is reading through.
     -> Int          -- ^ Counter to keep track of the number of steps (transitions) done.
     -> Maybe TMTape -- ^ Returns Nothing if the 'TuringMachine' rejects. Just 'TMTape' otherwise.
step (TM q a qa qr ts) tp x
    | q `elem` qa = Just tp
    | q `elem` qr = Nothing
    | otherwise   = step (TM newState a qa qr ts) newTp (x+1)
        where
            symbol      = currentCell tp
            tf          = head $ filter (\x -> inState x == q && inSymbol x == symbol) ts
            newState    = outState tf
            wroteTape   = writeToCell tp (outSymbol tf)
            newTp       
                | outMove tf == L = tapeLeft wroteTape
                | outMove tf == R = tapeRight wroteTape Blank