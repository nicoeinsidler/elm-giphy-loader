import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Http exposing (get, send)

-- MAIN

apikey = "0S5ki7Ub2N0lZlHcTD1vfhKacSB88tB4"

main = 
    Browser.sandbox{ init = init, update = update, view = view}


-- MODEL

type Maybe a = Just a | Nothing

type alias Model =
    { topic : Maybe String,
        url : Maybe String
    }


init : Model
init =
    Model Nothing Nothing


-- UPDATE

getRandomGif : String -> Cmd Msg
getRandomGif topic =
    let 
        url = "https://api.giphy.com/v1/gifs/random?api_key=????????????????????????&rating=R&tag=" ++ topic
    in Https.send NewGif (Https.get url decodeGifUrl)


decodeGifUrl : Decode.Decoder String
decodeGifUrl = 
    Decode.at [ "data" , "images", "fixed_height_small_still", "url" ] Decode.string

type Msg = Renew | ChangeTopic

update : Msg -> Model -> (Model, Cmd Msg)
update msg model = 
    case msg of
        Renew ->
            -- do stuff
        
        ChangeTopic ->
            -- do stuff



-- VIEW


view model =
    div []
        [ input [ placeholder "for example: guinea pig", value model.topic, onInput ChangeTopic ] []
        , button [onClick Renew] [ text "Get a new GIF!" ]
        , img [] [ model.url ]
        ]