#' Divide observations into folds
#'
#' @param nfolds The number of folds
#' @param data the dataset
#' @param cvType a character vector, indicating the type of cross-validation required, either blocked or random
#' @param coords the names of the coordinates in data
#'
#' @return the vector of folds
#' @importFrom stats kmeans
#' @export
#'
#' @examples
#' nfolds <- 10
#' data <- expand.grid("x" = seq_len(10), "y" = seq_len(10))
#' randomFolds <- makeFolds(nfolds = nfolds, data, "random", c("x", "y"))
#' blockedFolds <- makeFolds(nfolds = nfolds, data, "blocked", c("x", "y"))
makeFolds = function(nfolds, data, cvType, coords){
    folds <- switch(cvType,
                   "random" = sample(rep(seq_len(nfolds), length.out = nrow(data))),#Also uneven fold sizes
                   "blocked" = kmeans(data[, coords], centers = nfolds)$cluster,
                   stop("Unknown CV strategy"))
    while(any(table(folds)<=1)){ #Avoid single observation folds
        folds <- makeFolds(nfolds, data, cvType)
    }
    return(folds)
}
