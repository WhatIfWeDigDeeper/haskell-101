module CaesarCipherSpec where

import Test.QuickCheck
import CaesarCipher(
    encode,
    crack)

prop_encode_decode n xs = encode n xs == decode xs

-- main = quickCheck prop_revapp
main = quickCheck prop_encode_decode
-- /show