--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import Data.Monoid (mappend)
import Data.Typeable

-- latex
import Text.Pandoc.Options

import Hakyll
--------------------------------------------------------------------------------

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
