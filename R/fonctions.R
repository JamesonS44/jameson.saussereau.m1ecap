#' @importFrom stats reorder
#' @importFrom dplyr filter mutate group_by summarise arrange desc slice_head
#' @importFrom ggplot2 ggplot aes geom_col coord_flip labs theme_minimal
NULL

utils::globalVariables(c("Country", "Quantity", "UnitPrice", "CA", "CA_moyen", ".data"))

#' Filter data by country
#'
#' @param data The retail dataset
#' @param pays Country name to filter (character)
#' @return A filtered data.frame
#' @export
filtrer_pays <- function(data, pays) {
  dplyr::filter(data, Country == pays)
}

#' Grouped calculation: average revenue by group
#'
#' @param data The retail dataset
#' @param groupe Grouping variable (eg: "Country")
#' @return A data.frame with average revenue per group
#' @export
calcul_groupe <- function(data, groupe) {
  data |>
    dplyr::mutate(CA = Quantity * UnitPrice) |>
    dplyr::group_by(.data[[groupe]]) |>
    dplyr::summarise(CA_moyen = mean(CA), .groups = "drop") |>
    dplyr::arrange(dplyr::desc(CA_moyen))
}

#' ggplot2 chart of average revenue by group
#'
#' @param data Result of `calcul_groupe()`
#' @param n Number of groups to display (default: 10)
#' @return A ggplot2 chart
#' @export
graphique_ca <- function(data, n = 10) {
  data |>
    dplyr::slice_head(n = n) |>
    ggplot2::ggplot(ggplot2::aes(x = reorder(.data[[names(data)[1]]], CA_moyen),
                                 y = CA_moyen)) +
    ggplot2::geom_col(fill = "#2E86AB") +
    ggplot2::coord_flip() +
    ggplot2::labs(title = "CA moyen par groupe",
                  x = names(data)[1], y = "CA moyen (GBP)") +
    ggplot2::theme_minimal()
}
