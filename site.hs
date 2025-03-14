--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import           Hakyll

import           Data.Maybe

--------------------------------------------------------------------------------
main :: IO ()
main = hakyllWith config $ do
    ----------------------------------------
    -- Moving images and css files, making them observables for everyone.

    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match "extras/*" $ do
        route idRoute
        compile copyFileCompiler

    -- CName ceresa.ar
    -- match "CNAME" $ do
    --     route   idRoute
    --     compile copyFileCompiler

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

    -- List of projects
    create ["projects/index.html"] $ do
      let ctx
            = defaultContext
            <> titleField "Projects"
            <> allProjectContext
      route idRoute
      compile $ do
        makeItem mempty
        -- Body info
        >>= loadAndApplyTemplate "templates/project-archive.html" ctx
        -- Context site info
        >>= loadAndApplyTemplate "templates/indextemp.html" ctx
        >>= relativizeUrls

    match "pubs/*.md" $ version "pub" $ do
      let ctx = defaultContext
      route $ setExtension "html"
      compile $ do
        pandocCompiler
        >>= loadAndApplyTemplate "templates/pubs.html" ctx
        >>= loadAndApplyTemplate "templates/indextemp.html" ctx
        >>= relativizeUrls

    match "projects/*.markdown" $ version "projects" $ do
      let ctx = defaultContext
      route $ setExtension "html"
      compile $ do
        pandocCompiler
        >>= loadAndApplyTemplate "templates/projects.html" ctx
        >>= loadAndApplyTemplate "templates/indextemp.html" ctx
        >>= relativizeUrls

    ----------------------------------------
    -- Index
    match "index.html" $ do
        -- let ctx multi = defaultContext <> recentPubContext 5 <> constField "multi" multi
        let ctx = defaultContext <> recentPubContext 5 <> addMulti
        route idRoute
        compile $
          getResourceBody
                >>= applyAsTemplate ctx
                >>= loadAndApplyTemplate "templates/indextemp.html" ctx
                >>= relativizeUrls

    -- Projects
    match "projects.html" $ do
      route (constRoute "projects/index.html")
      compile $
        getResourceBody
         >>= loadAndApplyTemplate "templates/indextemp.html" defaultContext
         >>= relativizeUrls

    -- Contact
    match "contact.html" $ do
      route (constRoute "contact/index.html")
      compile $
        getResourceBody
         >>= loadAndApplyTemplate "templates/indextemp.html" defaultContext
         >>= relativizeUrls

    -- Others
    match "keyboards.html" $ do
      route (constRoute "keyboards/index.html")
      compile $
        getResourceBody
         >>= loadAndApplyTemplate "templates/indextemp.html" defaultContext
         >>= relativizeUrls

    -- Extremely similar to index but showing my homepage :shrug:
    match "homepage.html" $ do
      let ctx = defaultContext
      route idRoute
      compile $
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

loadProjs :: Compiler [Item String]
loadProjs = loadAll ("projects/*" .&&. hasVersion "projects")

-- listContextWith

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

allContext :: String -> Compiler [Item String] -> Context String
allContext str cmp = mkListContext str cmp Nothing

allPubsContext = allContext "pubs" loadPubs
allProjectContext = allContext "projects" loadProjs

recentPubContext :: Int -> Context String
recentPubContext = mkListContext "pubs" loadPubs . Just
