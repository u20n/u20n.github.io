--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import Data.Monoid (mappend)
import Data.Typeable

-- latex
import           Text.Pandoc.Options

import Hakyll
--------------------------------------------------------------------------------

-- so that it exports to the correct folder
config::Configuration
config = defaultConfiguration {
  destinationDirectory = "../docs/notes/"
}

main :: IO ()
main = hakyllWith config $ do
    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler
  
    -- tags
    {-#
    tags <- buildTags "items/*" (fromCapture "tags/*.html")
    tagsRules tags $ \tag pattern -> do
      let title = "tagged w/\"" ++ tag ++ "\""
      route idRoute
      compile $ do
        posts <- recentFirst =<< loadAll pattern
        let ctx = constField "title" title
                  `mappend` listField "posts" (iCtxTags tags) (return posts)
                  `mappend` defaultContext

        makeItem ""
          >>= loadAndApplyTemplate "templates/tag.html" ctx
          >>= loadAndApplyTemplate "templates/default.html" ctx
          >>= relativizeUrls
    #-}
    match "items/*" $ do
        route $ setExtension "html"
        compile $ pandocMathCompiler
            >>= loadAndApplyTemplate "templates/item.html"    iCtx
            >>= loadAndApplyTemplate "templates/default.html" iCtx
            >>= relativizeUrls

    match "index.html" $ do
        route idRoute
        compile $ do
            items <- recentFirst =<< loadAll "items/*"
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
    -- TODO: actually fix date
    defaultContext

{-#
iCtxTags :: Tags -> Context String
iCtxTags tags = tagsField "tags" tags `mappend` iCtx
#-}

pandocMathCompiler =
    let mathExtensions    = extensionsFromList [Ext_tex_math_dollars, Ext_tex_math_double_backslash, Ext_latex_macros]
        defaultExtensions = writerExtensions defaultHakyllWriterOptions
        newExtensions     = defaultExtensions <> mathExtensions
        writerOptions     = defaultHakyllWriterOptions {
                              writerExtensions = newExtensions,
                              writerHTMLMathMethod = MathJax ""
                            }
    in pandocCompilerWith defaultHakyllReaderOptions writerOptions
