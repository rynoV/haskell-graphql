{-# LANGUAGE OverloadedStrings #-}

module Main where

import API
import Control.Monad.IO.Class
import Web.Scotty

main :: IO ()
main = scotty 3000 $ post "/api" $ raw =<< (liftIO . api =<< body)
