module Paths_FizzBuzz (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/jesus/Katas/FizzBuzz/.cabal-sandbox/bin"
libdir     = "/home/jesus/Katas/FizzBuzz/.cabal-sandbox/lib/x86_64-linux-ghc-7.10.2/FizzBuzz-0.1.0.0-7CIyg1xc1Mc8NA1nQ4vG0S"
datadir    = "/home/jesus/Katas/FizzBuzz/.cabal-sandbox/share/x86_64-linux-ghc-7.10.2/FizzBuzz-0.1.0.0"
libexecdir = "/home/jesus/Katas/FizzBuzz/.cabal-sandbox/libexec"
sysconfdir = "/home/jesus/Katas/FizzBuzz/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "FizzBuzz_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "FizzBuzz_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "FizzBuzz_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "FizzBuzz_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "FizzBuzz_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
