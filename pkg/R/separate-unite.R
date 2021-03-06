separate_.tbl_HS2 =
  function() {
    stopif(
      convert || extra != "warn" || fill != "warn",
      "additional arguments not supported yet")
    if(is.numeric(sep)){
      sep = as.integer(c(0L, sep)) + 1L
      len = diff(sep)
      stopif(
        length(sep) != length(into),
        "Number of split points should be one less than new cols")
      tmp =
        mutate_(
          data,
          .dots =
            setNames(
              c(
                map(
                  seq_along(len),
                  function(i)
                    interp(
                      ~substr(col, sepi, len),
                      col = as.name(col),
                      sepi = sep[i],
                      len = len[i])),
                list(
                  interp(
                    ~substr(col, sep),
                    col = as.name(col),
                    sep = sep[length(sep)]))),
              into))}
    else {
      sep  = gsub(x = sep, pattern = "\\\\", replacement = "\\\\\\\\")
      tmp =
        mutate_(
          data,
          .dots =
            setNames(
              list(interp(~split(col, sep), col = as.name(col))),
              "pjezgdwlsd")) %>%
        mutate_(
          .dots =
            setNames(
              map(seq_along(into), function(i) interp(~pjezgdwlsd[j], j = i - 1L)),
              into)) %>%
        select(-pjezgdwlsd)}
    if(remove)
      select_(tmp, interp(~-col, col = as.name(col)))
    else
      tmp}

formals(separate_.tbl_HS2) = formals(tidyr::separate_)

extract_.tbl_HS2 =
  function() {
    stopif(convert, "convert options not supported")
    regex  = gsub(x = regex, pattern = "\\\\", replacement = "\\\\\\\\")
    tmp =
      mutate_(
        data,
        .dots =
          setNames(
            map(
              seq_along(into),
              function(i)
                interp(
                  ~regexp_extract(col, regex, j),
                  col = as.name(col),
                  j = as.integer(i))),
            into))
    if(remove)
      select_(tmp, interp(~-col, col = as.name(col)))
    else
      tmp}

formals(extract_.tbl_HS2) = formals(tidyr::extract_)

unite_.tbl_HS2 =
  function(){
    concat_all =
      as.call(c(as.name("concat_ws"), as.list(sep), unname(map(from, as.name))))
    tmp = mutate_(data, .dots = setNames(list(interp(~z, z = concat_all)), col))
    if(remove)
      select_(tmp, .dots = map(from, function(var) interp(~-var, var = as.name(var))))
    else
      tmp}

formals(unite_.tbl_HS2) = formals(tidyr::unite_)
