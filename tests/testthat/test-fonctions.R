test_that("filtrer_pays retourne uniquement le bon pays", {
  result <- filtrer_pays(retail, "France")
  expect_true(all(result$Country == "France"))
})

test_that("calcul_groupe retourne une colonne CA_moyen", {
  result <- calcul_groupe(retail, "Country")
  expect_true("CA_moyen" %in% names(result))
})

test_that("graphique_ca retourne un objet ggplot", {
  result <- calcul_groupe(retail, "Country")
  p <- graphique_ca(result, n = 5)
  expect_true(inherits(p, "gg"))
})
