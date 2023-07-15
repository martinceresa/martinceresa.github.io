--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import           Hakyll

import           Data.Maybe

--------------------------------------------------------------------------------
main :: IO ()
main = hakyllWith config $ do
    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    ----------------------------------------
    -- Publications
    create ["pubs/index.html"] $ do
      let ctx
            = defaultContext
            <> titleField "Publications"
            <> allPubsContext
      route idRoute
      compile $ do
        makeItem mempty
        -- Body info
        >>= loadAndApplyTemplate "templates/pubs-archive.html" ctx
        -- Context site info
        >>= loadAndApplyTemplate "templates/indextemp.html" ctx
        >>= relativizeUrls

    match "pubs/*" $ version "pub" $ do
      let ctx = defaultContext
      route $ setExtension "html"
      compile $ do
        pandocCompiler
        >>= loadAndApplyTemplate "templates/pubs.html" ctx
        >>= loadAndApplyTemplate "templates/default.html" ctx
        >>= relativizeUrls

    ----------------------------------------
    -- Index
    -- (toUrl . fromMaybe "filePath" <$> getRoute (fromFilePath "pubs/ceresa.multi.22.md")) >>= \multiUrl ->

    match "index.html" $ do
        -- let ctx multi = defaultContext <> recentPubContext 5 <> constField "multi" multi
        let ctx = defaultContext <> recentPubContext 5 <> addMulti
        route idRoute
        compile $
          -- (load (setVersion (Just "pub") $ fromFilePath "pubs/ceresa.multi.22.md") :: Compiler (Item String))
          -- >>=  (toUrl . fromMaybe "#" <$>) . getRoute . itemIdentifier
          -- >>= \multiUrl ->
          getResourceBody
                >>= applyAsTemplate ctx
                >>= loadAndApplyTemplate "templates/indextemp.html" ctx
                >>= relativizeUrls

    match "templates/*" $ compile templateBodyCompiler


    ----------------------------------------
    -- Projects
    -- match "proj/*" $ version "proj" $ do

--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext

----------------------------------------
-- Github config
config :: Configuration
config = defaultConfiguration
  { destinationDirectory = "docs"
  }

----------------------------------------
-- Context building stuff

-- Loading stuff
loadPubs :: Compiler [Item String]
loadPubs = loadAll ("pubs/*" .&&. hasVersion "pub")

mkListContext :: String -> Compiler [Item String] -> Maybe Int -> Context a
mkListContext name clist mbn =
  listField name defaultContext $
  (recentFirst =<< clist) >>= \items -> return (maybe items (`take` items) mbn)

addRouteField :: String -> Identifier -> Context a
addRouteField fn ident = field fn (const urlPath)
  where
    urlPath :: Compiler String
    urlPath = fromMaybe "#" <$> getRoute ident

addMulti :: Context a
addMulti = addRouteField "multi" (setVersion (Just "pub") $ fromFilePath "pubs/ceresa.multi.22.md")

allPubsContext :: Context String
allPubsContext = mkListContext "pubs" loadPubs Nothing

recentPubContext :: Int -> Context String
recentPubContext = mkListContext "pubs" loadPubs . Just
