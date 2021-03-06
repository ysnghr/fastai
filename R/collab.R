#' @title CollabDataLoaders_from_df
#'
#' @description Create a `DataLoaders` suitable for collaborative filtering from `ratings`.
#'
#' @param ratings ratings
#' @param valid_pct The random percentage of the dataset to set aside for validation (with an optional seed)
#' @param user_name The name of the column containing the user (defaults to the first column)
#' @param item_name The name of the column containing the item (defaults to the second column)
#' @param rating_name The name of the column containing the rating (defaults to the third column)
#' @param seed seed
#' @param path The folder where to work
#' @param bs The batch size
#' @param val_bs The batch size for the validation DataLoader (defaults to bs)
#' @param shuffle_train If we shuffle the training DataLoader or not
#' @param device device
#'
#' @export
CollabDataLoaders_from_df <- function(ratings, valid_pct = 0.2, user_name = NULL,
                                      item_name = NULL, rating_name = NULL, seed = NULL,
                                      path = ".", bs = 64, val_bs = NULL, shuffle_train = TRUE,
                                      device = NULL) {

  args <- list(
    ratings = ratings,
    valid_pct = valid_pct,
    user_name = user_name,
    item_name = item_name,
    rating_name = rating_name,
    seed = seed,
    path = path,
    bs = as.integer(bs),
    val_bs = val_bs,
    shuffle_train = shuffle_train,
    device = device
  )

  if(!is.null(seed)) {
    args$seed <- as.integer(args$seed)
  }

  if(!is.null(val_bs)) {
    args$val_bs <- as.integer(args$val_bs)
  }

  do.call(collab$CollabDataLoaders$from_df, args)

}


#' @title CollabDataLoaders_from_dblock
#'
#' @description Create a dataloaders from a given `dblock`
#'
#' @param dblock dblock
#' @param source source
#' @param path The folder where to work
#' @param bs The batch size
#' @param val_bs The batch size for the validation DataLoader (defaults to bs)
#' @param shuffle_train If we shuffle the training DataLoader or not
#' @param device device
#'
#' @export
CollabDataLoaders_from_dblock <- function(dblock, source, path = ".", bs = 64,
                                          val_bs = NULL, shuffle_train = TRUE,
                                          device = NULL) {

  args <- list(
    dblock = dblock,
    source = source,
    path = path,
    bs = as.integer(bs),
    val_bs = val_bs,
    shuffle_train = shuffle_train,
    device = device
  )

  if(!is.null(val_bs)) {
    args$val_bs <- as.integer(args$val_bs)
  }

  do.call(collab$CollabDataLoaders$from_dblock, args)

}



#' @title Collab_learner
#'
#' @description Create a Learner for collaborative filtering on `dls`.
#'
#'
#' @param dls dls
#' @param n_factors The number of factors
#' @param use_nn use_nn
#' @param emb_szs emb_szs
#' @param layers layers
#' @param config config
#' @param y_range y_range
#' @param loss_func It can be any loss function you like. It needs to be one of fastai's if you want to use Learn.predict or Learn.get_preds, or you will have to implement special methods (see more details after the BaseLoss documentation).
#' @param opt_func The function used to create the optimizer
#' @param lr lr
#' @param splitter It is a function that takes self.model and returns a list of parameter groups (or just one parameter group if there are no different parameter groups).
#' @param cbs Cbs is one or a list of Callbacks to pass to the Learner.
#' @param metrics It is an optional list of metrics, that can be either functions or Metrics.
#' @param path The folder where to work
#' @param model_dir Path and model_dir are used to save and/or load models.
#' @param wd It is the default weight decay used when training the model.
#' @param wd_bn_bias It controls if weight decay is applied to BatchNorm layers and bias.
#' @param train_bn It controls if BatchNorm layers are trained even when they are supposed to be frozen according to the splitter.
#' @param moms The default momentums used in Learner.fit_one_cycle.
#'
#' @export
collab_learner <- function(dls, n_factors = 50, use_nn = FALSE,
                           emb_szs = NULL, layers = NULL, config = NULL,
                           y_range = NULL, loss_func = NULL, opt_func = Adam(),
                           lr = 0.001, splitter = trainable_params(), cbs = NULL,
                           metrics = NULL, path = NULL, model_dir = "models",
                           wd = NULL, wd_bn_bias = FALSE, train_bn = TRUE,
                           moms = list(0.95, 0.85, 0.95)) {

  python_function_result <- fastai2$collab$collab_learner(
    dls = dls,
    n_factors = as.integer(n_factors),
    use_nn = use_nn,
    emb_szs = emb_szs,
    layers = layers,
    config = config,
    y_range = y_range,
    loss_func = loss_func,
    opt_func = opt_func,
    lr = lr,
    splitter = splitter,
    cbs = cbs,
    metrics = metrics,
    path = path,
    model_dir = model_dir,
    wd = wd,
    wd_bn_bias = wd_bn_bias,
    train_bn = train_bn,
    moms = moms
  )

}


#' @title trainable_params
#'
#' @description Return all trainable parameters of `m`
#'
#'
#' @param m m
#'
#' @export
trainable_params <- function(m) {

 if(missing(m)) {
   collab$trainable_params
 } else {
   collab$trainable_params(
     m = m
   )
 }

}


#' @title Get weights
#'
#' @description Weight for item or user (based on `is_item`) for all in `arr`
#'
#' @param object object
#' @param arr arr
#' @param is_item is_item
#' @param convert to matrix
#' @export
get_weights <- function(object, arr, is_item = TRUE, convert = FALSE) {

  if(convert)
    learn$model$weight(arr = arr,is_item = is_item)$numpy()
  else
    learn$model$weight(arr = arr,is_item = is_item)

}



#' @title Get bias
#'
#' @description Bias for item or user (based on `is_item`) for all in `arr`
#'
#' @param object object
#' @param arr arr
#' @param is_item is_item
#' @param convert to matrix
#' @export
get_bias <- function(object, arr, is_item = TRUE, convert = TRUE) {

  if(convert)
    learn$model$bias(arr = arr,is_item = is_item)$numpy()
  else
    learn$model$bias(arr = arr,is_item = is_item)

}


#' @title Pca
#'
#' @description Compute PCA of `x` with `k` dimensions.
#'
#'
#' @param object object
#' @param k k
#' @param convert to matrix
#' @export
pca <- function(object, k = 3, convert = TRUE) {

  if(convert){
    result = object$pca(
      k = as.integer(k)
    )
    t(result$t()$numpy())
  } else {
    object$pca(
      k = as.integer(k)
    )
  }

}

