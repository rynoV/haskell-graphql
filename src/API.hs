{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module API (api) where

import Data.ByteString.Lazy (ByteString)
import Data.Morpheus (interpreter)
import Data.Morpheus.Document (importGQLDocument)
import Data.Morpheus.Types (RootResolver (..), Undefined (..))
import Data.Text (Text)

importGQLDocument "schema.gql"

rootResolver :: RootResolver IO () Query Undefined Undefined
rootResolver =
  RootResolver
    { queryResolver = Query {deity},
      mutationResolver = Undefined,
      subscriptionResolver = Undefined
    }
  where
    deity :: (Monad m) => DeityArgs -> m (Deity m)
    deity DeityArgs {name} =
      return
        Deity
          { name = return name,
            power = return (Just "Shapeshifting")
          }

api :: ByteString -> IO ByteString
api = interpreter rootResolver