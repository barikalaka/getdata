getData <- function(url,...,headers=NULL,cached=TRUE){
 
  resp <- loadCache(list(url))
  if(is.null(resp)) {
    
    resp <- GET(url, add_headers(customeheader = "CS")) # response object, add customheader
    saveCache(resp, key)
  }
  body <- ""
  if (http_type(resp) == "json"){
    body <- content(resp, as="parsed") # if response type is JSON, parsed it to a list 
  }else{
    body <- content(resp, as="text") # return text representation of the response body
  }
  
  return(body)
}
