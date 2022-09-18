{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_validation_book (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/ts/Code/haskell/finding_success_haskell/chapter3/validation-book/.stack-work/install/x86_64-linux-tinfo6/00ec7c91da5666e5edc89d5bb1292240b4355a1da2c8ee28f8e5ecdd03e1987e/9.0.2/bin"
libdir     = "/home/ts/Code/haskell/finding_success_haskell/chapter3/validation-book/.stack-work/install/x86_64-linux-tinfo6/00ec7c91da5666e5edc89d5bb1292240b4355a1da2c8ee28f8e5ecdd03e1987e/9.0.2/lib/x86_64-linux-ghc-9.0.2/validation-book-0.1.0.0-15cqDzp1aKyJC1VPGtGoQH-validation-book"
dynlibdir  = "/home/ts/Code/haskell/finding_success_haskell/chapter3/validation-book/.stack-work/install/x86_64-linux-tinfo6/00ec7c91da5666e5edc89d5bb1292240b4355a1da2c8ee28f8e5ecdd03e1987e/9.0.2/lib/x86_64-linux-ghc-9.0.2"
datadir    = "/home/ts/Code/haskell/finding_success_haskell/chapter3/validation-book/.stack-work/install/x86_64-linux-tinfo6/00ec7c91da5666e5edc89d5bb1292240b4355a1da2c8ee28f8e5ecdd03e1987e/9.0.2/share/x86_64-linux-ghc-9.0.2/validation-book-0.1.0.0"
libexecdir = "/home/ts/Code/haskell/finding_success_haskell/chapter3/validation-book/.stack-work/install/x86_64-linux-tinfo6/00ec7c91da5666e5edc89d5bb1292240b4355a1da2c8ee28f8e5ecdd03e1987e/9.0.2/libexec/x86_64-linux-ghc-9.0.2/validation-book-0.1.0.0"
sysconfdir = "/home/ts/Code/haskell/finding_success_haskell/chapter3/validation-book/.stack-work/install/x86_64-linux-tinfo6/00ec7c91da5666e5edc89d5bb1292240b4355a1da2c8ee28f8e5ecdd03e1987e/9.0.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "validation_book_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "validation_book_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "validation_book_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "validation_book_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "validation_book_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "validation_book_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
