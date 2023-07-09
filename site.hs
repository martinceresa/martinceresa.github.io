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

    match "index.org" $ do
        route $ setExtension "html"
        compile $ pandocCompiler
                >>= applyAsTemplate defaultContext
                >>= loadAndApplyTemplate "templates/default.html" defaultContext
                >>= relativizeUrls

    match "templates/*" $ compile templateBodyCompiler

    ----------------------------------------
    -- -- Projects
    -- create ["projects/index.html"] $ do
    --   let ctx = defaultContext <> allProjects
    --   route idRoute
    --   compile $ do
    --     newItem

    -- match "projects/*" $ version "projects" $ do
    --   let ctx = defaultContext <> dateContext
    --   route idRoute
    --   compile $ do
    --     pandocCompiler
    --     >>= loadAndApplyTemplate "templates/pages.html" ctx
    --     >>= loadAndApplyTemplate "templates/default.html" ctx
    --     >>= relativizeUrls

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
loadStuff :: String -> Compiler [Item String]
loadStuff str = loadAll ("" .&&. hasVersion str)

mkListContext :: String -> Compiler [Item String] -> Maybe Int -> Context a
mkListContext name clist mbn =
  listField name defaultContext $
  (recentFirst =<< clist) >>= \items -> return (maybe items (`take` items) mbn)
