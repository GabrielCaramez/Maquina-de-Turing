{- |
Module      :  TuringMachineParser
Description :  Parses a given TuringMachine description.
Copyright   :
License     :
Maintainer  :  sy35@st-andrews.ac.uk

Parses a description given in the form: (Taken from specifications which can be found at https://studres.cs.st-andrews.ac.uk/CS3052/Practicals/P01-turingmachines.pdf)
    
    - The first line is the word "states" followed by the number of states n.

    - Then there should be n lines, each containing the name of a state, possibly followed by a + for an accepting state, or - for a rejecting state.

    - Then a line with the world "alphabet" followed by the number of letters in the tape alphabet, followed by those letters, separated by spaces.

    - Then an arbitrary number of lines representing the transition table, each of which has the form
        \<state1\> \<tapeinput\> \<state2\> \<tapeoutput\> \<move\>
      where \<move\> is either L or R,
            \<state1\> and \<state2\> are mentioned in "states"
            \<tapeinput\> and \<tapeoutput\> are mentioned in "alphabet"

By convention, the first state mentioned is the start state. Not also that underscore (_) is used for the blank character, which does not need to be mentioned explicity in the alphabet.

This parser returns Maybe TM depending on whether the TuringMachine description was in the correct format.
-}
module TuringMachineParser where

import qualified Data.Set as Set
import qualified Data.List as List

import Data.List.Split
import Data.Maybe

import TuringMachine

-- | Creates a Set which contains all Tape Alphabet.
parseAlphabet :: [String]           -- ^ List of strings in the format ["alphabet", n, ...] with n strings that denote a symbol in the alphabet.
              -> Maybe TapeAlphabet -- ^ Returns Nothing if the list of strings is not in the specified format. Just TapeAlphabet otherwise.
parseAlphabet (x:y:xs)
    | x /= "alphabet" && length xs /= read y = Nothing
    | otherwise                              = Just s
        where 
            set = Set.singleton Blank
            s   = foldr Set.insert set $ map createCell xs 

-- | Creates a TM by parsing a list of States.
parseStates :: Maybe TapeAlphabet -- ^ TapeAlphabet which the TM reads.
            -> [String]           -- ^ List of States the TM has, including the accept and rejecting States.
            -> Maybe TM           -- ^ Returns Nothing if the TapeAlphabet is Nothing. Just TM otherwise.
parseStates set xs
    | isNothing set = Nothing
    | otherwise     = Just TM { currState = head xs,
                                alphabet  = fromJust set,
                                qa        = map getCleanState $ filter (\x -> List.isInfixOf "+" x) xs,
                                qr        = map getCleanState $ filter (\x -> List.isInfixOf "-" x) xs,
                                delta     = []
                              }

-- | Sanitizes a State description by removing "+", "-" and " " from the String.
getCleanState :: String -- ^ State description.
              -> String -- ^ Returns cleaned description that contains only the name of that State.
getCleanState xs = [x | x <- xs, not (x `elem` "+- ")]


-- | Updates the TM with a list of Transitions parsed from the list of Strings.
parseTransitions :: [String] -- ^ List of Transition descriptions 
                 -> TM       -- ^ TM to be updated. Any Transitions in the TM will be replaced.
                 -> TM       -- ^ Returns updated TM. 
parseTransitions xs (TM cState a aState rState _) 
    = TM { currState = cState, alphabet = a, qa = aState, qr = rState,  
           delta = map createTransition $ map words xs
         } 

-- | Creates a single Transition.
createTransition :: [String]    -- ^ Description of the transition. Must be in the format [\<inputstate\>, \<inputsymbol\>, \<outputstate\>, \<outputsymbol\>, \<move\>].
                 -> Transition  -- ^ Returns the transition created by the description.
createTransition [iState, iSym, oState, oSym, m]
    = Transition iState (createCell iSym) oState (createCell oSym) move
    where
        move | m == "L" = L
             | m == "R" = R


-- | Creates a single Cell of the TuringTape for the TuringMachine
createCell :: String -- ^ String contents of the Cell
           -> Cell   -- ^ Returns a Cell. The Cell is Blank if the input String is an underscore (_)
createCell s | '_' `elem` s = Blank
             | otherwise    = Cell s


-- | Creates a TM given a full description as described in the module description. 
createTM :: [String] -- ^ Description of the TM. Each element of the list is a line of the description.
         -> Maybe TM -- ^ Returns Nothing if the description is in the wrong format. Just TM otherwise.
createTM (x:xs)
    | isNothing tm = Nothing
    | otherwise    = Just $ parseTransitions ts $ fromJust tm 
        where
            numStates = read $ last $ words x
            s         = parseAlphabet $ splitOn " " $ head $ drop numStates xs
            ts        = drop (numStates+1) xs
            tm        = parseStates s $ take numStates xs