--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import Data.Monoid (mappend)
import Data.Typeable

-- latex
import Text.Pandoc.Options

import Hakyll
--------------------------------------------------------------------------------

-- RSS & Atom
feedConfig::FeedConfiguration
feedConfig = FeedConfiguration { 
  feedTitle       = "notes.u2on", 
  feedDescription = "various notes and writings on various topics to various degrees of completeness and accuracy",
  feedAuthorName  = "u2on",
  feedAuthorEmail = "me@notu.dev",
  feedRoot        = "https://notu.dev/notes"
}

-- so that it exports to the correct folder
config::Configuration
config = defaultConfiguration {
  destinationDirectory = "../docs/notes/"
}

main::IO()
main = hakyllWith config $ do  
  match ("images/*") $ do
    route   idRoute
    compile copyFileCompiler

  match ("css/*.css") $ do
    route   idRoute
    compile compressCssCompiler
  
  -- tags    
  tags <- buildTags "posts/*.md" (fromCapture ("tags/*.html"))
  tagsRules tags $ \tag pattern -> do
      let title = "items tagged |" ++ tag ++ "|"
      route idRoute
      compile $ do
        items <- recentFirst =<< loadAll pattern
        let ctx = constField "title" title
                  `mappend` listField "items" (iCtxTags tags) (return items)
                  `mappend` defaultContext

        makeItem ""
          >>= loadAndApplyTemplate ("templates/tag.html") ctx
          >>= loadAndApplyTemplate ("templates/default.html") ctx
          >>= relativizeUrls

  match "posts/*.md" $ do
    route $ setExtension "html"
    compile $ pandocMathCompiler
      >>= loadAndApplyTemplate ("templates/item.html")    (iCtxTags tags)
      >>= saveSnapshot "content"
      >>= loadAndApplyTemplate ("templates/default.html") (iCtxTags tags)
      >>= relativizeUrls

  match ("index.html") $ do
    route idRoute
    compile $ do
      items <- recentFirst =<< loadAll "posts/*.md" 
      let indexCtx =
              listField "items" iCtx (return items) `mappend`
              defaultContext
      getResourceBody
          >>= applyAsTemplate indexCtx
          >>= loadAndApplyTemplate "templates/default.html" indexCtx
          >>= relativizeUrls 
  -- literally the same thing, just different names
  create ["atom.xml"] $ do
    route idRoute
    compile $ do
        let feedCtx = iCtx `mappend` bodyField "description"
        posts <- fmap (take 10) . recentFirst =<<
            loadAllSnapshots "posts/*" "content"
        renderAtom feedConfig feedCtx posts

  create ["rss.xml"] $ do
    route idRoute
    compile $ do
        let feedCtx = iCtx `mappend` bodyField "description"
        posts <- fmap (take 10) . recentFirst =<<
            loadAllSnapshots "posts/*" "content"
        renderAtom feedConfig feedCtx posts

  match "templates/*" $ compile templateBodyCompiler

--------------------------------------------------------------------------------
iCtx::Context String
iCtx =
    dateField "date" "%m.%d.%0Y" `mappend`
    defaultContext

iCtxTags::Tags -> Context String
iCtxTags tags = tagsField "tags" tags `mappend` iCtx

-- tag index
-- I think just pushing the entire directory listing of "tags" is fine honestly
-- I know how to do that in C/Cpp but i have no idea how to do that in haskell.
--------------------------------------------------------------------------------

------ Header Parsing ------

------ Sidenotes ------

pandocMathCompiler =
    let mathExtensions    = extensionsFromList [Ext_tex_math_dollars, Ext_tex_math_double_backslash, Ext_latex_macros]
        defaultExtensions = writerExtensions defaultHakyllWriterOptions
        newExtensions     = defaultExtensions <> mathExtensions
        writerOptions     = defaultHakyllWriterOptions {
                              writerExtensions = newExtensions,
                              writerHTMLMathMethod = MathJax ""
                            }
    in pandocCompilerWith defaultHakyllReaderOptions writerOptions
