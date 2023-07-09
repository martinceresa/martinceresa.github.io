--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import           Hakyll

--------------------------------------------------------------------------------
main :: IO ()
main = hakyllWith config $ do
    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match "index.html" $ do
        let ctx = defaultContext <> recentPubContext 5
        route idRoute
        compile $
          getResourceBody
                >>= applyAsTemplate ctx
                >>= loadAndApplyTemplate "templates/indextemp.html" defaultContext
                >>= relativizeUrls

    match "templates/*" $ compile templateBodyCompiler

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
        >>= loadAndApplyTemplate "templates/publications.html" ctx
        >>= relativizeUrls

    match "pubs/*" $ version "pub" $ do
      let ctx = defaultContext
      route $ setExtension "html"
      compile $ do
        pandocCompiler
        >>= loadAndApplyTemplate "templates/pubs.html" ctx
        >>= loadAndApplyTemplate "templates/default.html" ctx
        >>= relativizeUrls

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

allPubsContext :: Context String
allPubsContext = mkListContext "pubs" loadPubs Nothing

recentPubContext :: Int -> Context String
recentPubContext = mkListContext "pubs" loadPubs . Just
