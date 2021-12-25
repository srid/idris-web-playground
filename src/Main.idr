module Main

import JS
import Web.Dom
import Web.Html
import Web.Raw.UIEvents

%foreign "browser:lambda:x=>{document.body.innerHTML = x}"
prim__setBodyInnerHTML : String -> PrimIO ()

setBodyInnerHtml : HasIO io => String -> io ()
setBodyInnerHtml = primIO . prim__setBodyInnerHTML

main : IO ()
main = do 
  consoleLog "Hello from Idris."
  let n = S (S (S Z))
  consoleLog $ show n
  setBodyInnerHtml $ "<i>This part is written by main.idr.</i> " ++ "<p><tt>" ++ show n ++ "</tt><p>"
  runJS $ do 
    btn <- createElement Button
    textContent btn .= "Click me!"
    Element.id btn .= "the_button"
    ignore $ (!body `appendChild` btn)
