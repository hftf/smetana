#!/usr/bin/env runhaskell

-- https://gist.github.com/mathematicalcoffee/e4f25350449e6004014f

import Text.Pandoc.JSON
import qualified Data.Map as M

main :: IO ()
main = toJSONFilter insertMeta

insertMeta :: Pandoc -> Pandoc
insertMeta (Pandoc meta xs) = Pandoc nullMeta (g meta)

g :: Meta -> [Block]
g = map (Para . similar) . fromMetaList . (M.! "similars") . fromMeta

similar :: MetaValue -> [Inline]
similar = fromMetaInlines . (M.! "id") . fromMetaMap

fromMeta (Meta x) = x
fromMetaList (MetaList x) = x
fromMetaMap (MetaMap x) = x
fromMetaInlines (MetaInlines x) = x
