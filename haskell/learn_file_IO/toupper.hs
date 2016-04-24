import System.IO
import Data.Char(toUpper)

main :: IO ()
main = do
       inhandle <- openFile "input.txt" ReadMode
       outhandle <- openFile "output.txt" WriteMode
       mainloop inhandle outhandle
       hClose inhandle
       hClose outhandle

mainloop :: Handle -> Handle -> IO ()
mainloop inh outh =
    do ineof <- hIsEOF inh
       if ineof
          then return ()
               else do inpStr <- hGetLine inh
                       hPutStrLn outh (map toUpper inpStr)
                       mainloop inh outh
