interface HttpTypes
    exposes [Request, Method, Header, TimeoutConfig, TrackerConfig, Part, Body, Response, Metadata, Error]
    imports []

Request : {
    method : Method,
    headers : List Header,
    url : Str,
    body : Body,
    timeout : TimeoutConfig,
    tracker : TrackerConfig,
    allowCookiesFromOtherDomains : Bool,
}

Method : [Options, Get, Post, Put, Delete, Head, Trace, Connect, Patch]

Header : [Header Str Str]

TimeoutConfig : [Timeout F64, NoTimeout]
TrackerConfig : [Tracker Str, NoTracker]

Part : [Part Str (List U8)]

Body : [
    Body [MimeType Str] (List U8),
    EmptyBody,
]

Response : [
    BadUrl Str,
    Timeout,
    NetworkError,
    BadStatus Metadata (List U8),
    GoodStatus Metadata (List U8),
]

Metadata : {
    url : Str,
    statusCode : U16,
    statusText : Str,
    headers : List Header,
}

Error : [
    BadUrl Str,
    Timeout,
    NetworkError,
    BadStatus U16,
    BadBody Str,
]
