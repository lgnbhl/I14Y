# Get a concept by ID

Calls the I14Y public API endpoint `/concepts/{conceptId}` and returns
the concept metadata. Multilingual fields (\`name\`, \`description\`,
...) are returned with one entry per language (de, en, fr, it, rm).

## Usage

``` r
i14y_get_concept(id = NULL, includeCodeListEntries = FALSE)
```

## Arguments

- id:

  string. The UUID of the concept.

- includeCodeListEntries:

  logical. If \`TRUE\`, the response includes the codelist entries for
  code-list concepts. Default \`FALSE\`.

## Value

A list with the concept metadata. \`NULL\` when offline.

## Examples

``` r
# \donttest{
i14y_get_concept(
  id = "08d94604-e058-62a2-aa25-53f84b974201" # DV_NOGA_DIVISION
)
#> $codeListEntryValueMaxLength
#> [1] 2
#> 
#> $codeListEntryValueType
#> [1] "String"
#> 
#> $conceptType
#> [1] "CodeList"
#> 
#> $conformsTo
#> list()
#> 
#> $description
#> $description$de
#> [1] "Zweite Ebene der Allgemeinen Systematik der Wirtschaftszweige (NOGA), bestehend aus Rubriken, die durch einen zweistelligen numerischen Code gekennzeichnet sind. Diese zweite Ebene wird durch die International Standard Industrial Classification of All Economic Activities (ISIC Rev.4) bestimmt."
#> 
#> $description$en
#> [1] "Second level of the General Classification of Economic Activities (NOGA) composed of headings identified by a two-digit numerical code. This second level is determined by the International Standard Industrial Classification of All Economic Activities (ISIC Rev.4)."
#> 
#> $description$fr
#> [1] "Deuxième niveau de la Nomenclature générale des activités économiques (NOGA) composé de rubriques identifiées par un code numérique à deux chiffres. Ce deuxième niveau est déterminé par la Classification internationale type, par industrie, de toutes les branches d’activité économique (CITI Rev.4)."
#> 
#> $description$it
#> [1] "Secondo livello della Nomenclatura generale delle attività economiche (NOGA) composto da rubriche identificate da un codice numerico a due cifre. Questo secondo livello è determinato dalla Classificazione Internazionale Standard Industriale di tutte le attività economiche (ISIC Rev.4)."
#> 
#> 
#> $id
#> [1] "08d94604-e058-62a2-aa25-53f84b974201"
#> 
#> $identifiers
#> [1] "NOGA_DIVISION"
#> 
#> $isLocked
#> [1] FALSE
#> 
#> $keywords
#> list()
#> 
#> $name
#> $name$de
#> [1] "NOGA Abteilung"
#> 
#> $name$en
#> [1] "NOGA Division"
#> 
#> $name$fr
#> [1] "NOGA Division"
#> 
#> $name$it
#> [1] "NOGA Divisione"
#> 
#> 
#> $replaces
#> list()
#> 
#> $isReplacedBy
#> list()
#> 
#> $publicationLevel
#> [1] "Public"
#> 
#> $publisher
#> $publisher$classification
#> $publisher$classification$code
#> [1] "0220"
#> 
#> $publisher$classification$name
#> $publisher$classification$name$de
#> [1] "Verwaltungseinheit des Bundes"
#> 
#> $publisher$classification$name$en
#> [1] "Administrative unit of the Confederation"
#> 
#> $publisher$classification$name$fr
#> [1] "Unité de l’administration fédérale"
#> 
#> $publisher$classification$name$it
#> [1] "Unità amministrativa della Confederazione"
#> 
#> 
#> 
#> $publisher$description
#> $publisher$description$de
#> [1] "Das BFS ist das nationale Kompetenzzentrum der öffentlichen Statistik der Schweiz. Es produziert und publiziert statistische Informationen über den Stand und die Entwicklung von Bevölkerung, Wirtschaft, Gesellschaft, Bildung, Forschung, Raum und Umwelt. Diese Informationen dienen der Meinungsbildung in der Bevölkerung sowie der Planung und Steuerung von zentralen Politikbereichen. Sie leisten einen wichtigen Beitrag für einen modernen, demokratischen Staat."
#> 
#> $publisher$description$en
#> [1] "The FSO is Switzerland's national competence centre for official statistics. It produces and publishes statistical information on the status and development of the population, economy, society, education, research, territory and the environment. This information is used for opinion building among the population and for the planning and management of key policy areas. They make an important contribution to a modern, democratic state."
#> 
#> $publisher$description$fr
#> [1] "L'OFS est le centre de compétence de la statistique publique suisse. Il produit des informations statistiques sur la population, l'économie, la société, la formation et la recherche, le territoire et l'environnement. Ces informations servent à la formation de l’opinion publique. Elles sont un outil de planification et de gouvernance dans tous les domaines de l’action politique et contribuent au bon fonctionnement de notre État moderne et démocratique."
#> 
#> $publisher$description$it
#> [1] "L’UST è il centro di competenza nazionale per la statistica pubblica della Svizzera. Produce e pubblica informazioni statistiche sullo stato e sull'evoluzione della popolazione, dell'economia, della società, della formazione, della ricerca, del territorio e dell'ambiente. Queste informazioni servono alla formazione dell'opinione pubblica nonché alla pianificazione e alla gestione in ambiti politici di centrale importanza. Forniscono un importante contributo per uno Stato moderno e democratico."
#> 
#> $publisher$description$rm
#> [1] ""
#> 
#> 
#> $publisher$homePage
#> [1] "https://bfs.admin.ch"
#> 
#> $publisher$id
#> [1] "a88d610b-62f9-4e45-b288-3b23ff4f1758"
#> 
#> $publisher$identifier
#> [1] "CH1"
#> 
#> $publisher$images
#> list()
#> 
#> $publisher$name
#> $publisher$name$de
#> [1] "Bundesamt für Statistik (BFS)"
#> 
#> $publisher$name$en
#> [1] "Federal Statistical Office (FSO)"
#> 
#> $publisher$name$fr
#> [1] "Office Fédéral de la Statistique (OFS)"
#> 
#> $publisher$name$it
#> [1] "Ufficio federale di statistica (UFS)"
#> 
#> $publisher$name$rm
#> [1] ""
#> 
#> 
#> $publisher$prefLabel
#> $publisher$prefLabel$de
#> [1] "BFS"
#> 
#> $publisher$prefLabel$en
#> [1] "FSO"
#> 
#> $publisher$prefLabel$fr
#> [1] "OFS"
#> 
#> $publisher$prefLabel$it
#> [1] "UFS"
#> 
#> $publisher$prefLabel$rm
#> [1] ""
#> 
#> 
#> $publisher$system
#> $publisher$system$createdAt
#> [1] "0001-01-01T00:00:00+00:00"
#> 
#> $publisher$system$modifiedAt
#> [1] "2026-07-10T07:18:44.32979+00:00"
#> 
#> 
#> $publisher$spatial
#> [1] "CH"
#> 
#> $publisher$spatialCH
#>   code name.de     name.en name.fr  name.it name.rm
#> 1 8100 Schweiz Switzerland  Suisse Svizzera  Svizra
#> 
#> $publisher$subAgents
#> list()
#> 
#> $publisher$uid
#> [1] "CHE131608474"
#> 
#> 
#> $registrationStatus
#> [1] "PreferredStandard"
#> 
#> $system
#> $system$createdAt
#> [1] "2025-05-07T16:29:13.001306+00:00"
#> 
#> 
#> $themes
#> list()
#> 
#> $validFrom
#> [1] "2007-12-31T23:00:00+00:00"
#> 
#> $version
#> [1] "3.0.0"
#> 
# }
```
