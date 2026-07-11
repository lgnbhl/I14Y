# Get dataset metadata by ID

Calls the I14Y public API endpoint `/datasets/{datasetId}` and returns
the dataset metadata: publication level, registration status,
distributions, contact points, themes, etc.

## Usage

``` r
i14y_get_dataset(id = NULL)
```

## Arguments

- id:

  string. The UUID of the dataset.

## Value

A list with the dataset metadata. \`NULL\` when offline.

## Examples

``` r
# \donttest{
i14y_get_dataset(
  id = "b902add5-9538-47ed-b663-f9fbfac92381" # SpiGes_Administratives
)
#> $accessRights
#> $accessRights$code
#> [1] "RESTRICTED"
#> 
#> $accessRights$name
#> $accessRights$name$de
#> [1] "Eingeschränkt"
#> 
#> $accessRights$name$en
#> [1] "Restricted"
#> 
#> $accessRights$name$fr
#> [1] "Restreint"
#> 
#> $accessRights$name$it
#> [1] "Ristretto"
#> 
#> 
#> $accessRights$uri
#> [1] "http://publications.europa.eu/resource/authority/access-right/RESTRICTED"
#> 
#> 
#> $confidentialityPerson
#> $confidentialityPerson$code
#> [1] "protect_person"
#> 
#> $confidentialityPerson$name
#> $confidentialityPerson$name$de
#> [1] "Enthält besonders schützenswerte Personendaten"
#> 
#> $confidentialityPerson$name$en
#> [1] "Contains particularly sensitive personal data"
#> 
#> $confidentialityPerson$name$fr
#> [1] "Contient des données personnelles sensibles"
#> 
#> $confidentialityPerson$name$it
#> [1] "Contiene dati personali degni di particolare protezione"
#> 
#> 
#> 
#> $conformsTo
#>                                                         uri
#> 1 https://www.fedlex.admin.ch/eli/cc/1995/1328_1328_1328/de
#> 2 https://www.fedlex.admin.ch/eli/cc/1993/2080_2080_2080/de
#>                                          label.de
#> 1 Bundesgesetz über die Krankenversicherung (KVG)
#> 2                  Bundesstatistikgesetz (BStatG)
#>                                          label.en
#> 1 Bundesgesetz über die Krankenversicherung (KVG)
#> 2                 Federal Statistics Act (FStatA)
#>                                       label.fr
#> 1 Loi fédérale sur l’assurance-maladie (LAMal)
#> 2       Loi sur la statistique fédérale (LSF)-
#>                                             label.it
#> 1 Legge federale sull’assicurazione malattie (LAMal)
#> 2            Legge sulla statistica federale (LStat)
#> 
#> $contactPoints
#>              hasEmail         kind                       fn.de
#> 1 spiges@bfs.admin.ch Organization Bundesamt für Statistik BFS
#>                         fn.en                                fn.fr
#> 1 Bundesamt für Statistik BFS Office fédéral de la statistique OFS
#>                                  fn.it
#> 1 Office fédéral de la statistique OFS
#>                                                          hasAddress.de
#> 1 Sektion Gesundheitsversorgung\nEspace de l'Europe 10\n2010 Neuchâtel
#>                                                          hasAddress.en
#> 1 Sektion Gesundheitsversorgung\nEspace de l'Europe 10\n2010 Neuchâtel
#>                                                      hasAddress.fr
#> 1 Section Services de santé\nEspace de l'Europe 10\n2010 Neuchâtel
#>                                                      hasAddress.it
#> 1 Section Services de santé\nEspace de l'Europe 10\n2010 Neuchâtel
#> 
#> $description
#> $description$de
#> [1] "Die Datenlieferung an die SpiGes-Plattform umfasst zwei Files: ein SpiGes-Datensatz (Daten-File) und ein Identifikatoren-File. Das hier genannte Daten-File enthält sämtliche «inhaltlichen» Daten der Erhebung. Das heisst, es enthält die folgenden Erhebungsteile: Administratives, Neugeborene, Psychiatrie, Diagnosen, Behandlungen, Medikamente, Rechnungen, KostenträgerFall und Patientenbewegungen "
#> 
#> $description$en
#> [1] "SpiGes Administratives Erhebungsvariablen"
#> 
#> $description$fr
#> [1] "La transmission des données à la plateforme SpiGes comprend deux fichiers : un ensemble de données SpiGes (fichier de données) et un fichier d'identifiants. Le fichier de données mentionné ici contient toutes les données « de contenu » de la collecte. Il comprend donc les parties suivantes : Administratives (données administratives), Neugeborene (nouveau-nés), Psychiatrie (psychiatrie), Diagnosen (diagnostics), Behandlungen (traitements), Medikamente (médicaments), Rechnung (facture), KostenträgerFall (CUFI) et Patientenbewegung (parcours des patient). "
#> 
#> $description$it
#> [1] "L’invio dei dati alla piattaforma SpiGes deve includere due file: un set di dati SpiGes (file di dati) e une file di identificatori. Il file di dati deve contenere tutti i dati «di contenuto» della rilevazione. In altre parole, contiene gli elementi seguenti (parti della rilevazione): Administratives (dati amministrativi), Neugeborene (neonati), Psychiatrie (psichiatria), Diagnosen (diagnosi), Behandlungen (trattamenti), Medikamente (medicamenti), Rechnung (fattura), KostenträgerFall (CUFI) e Patientenbewegung (trasferimento paziente). "
#> 
#> 
#> $distributions
#> list()
#> 
#> $documentation
#> list()
#> 
#> $frequency
#> $frequency$code
#> [1] "ANNUAL"
#> 
#> $frequency$name
#> $frequency$name$de
#> [1] "jährlich"
#> 
#> $frequency$name$en
#> [1] "annual"
#> 
#> $frequency$name$fr
#> [1] "annuel"
#> 
#> $frequency$name$it
#> [1] "annuale"
#> 
#> 
#> $frequency$uri
#> [1] "http://publications.europa.eu/resource/authority/frequency/ANNUAL"
#> 
#> 
#> $geoIvIds
#> list()
#> 
#> $id
#> [1] "b902add5-9538-47ed-b663-f9fbfac92381"
#> 
#> $identifiers
#> [1] "SpiGes_Administratives"
#> 
#> $images
#> list()
#> 
#> $isReferencedBy
#> list()
#> 
#> $issued
#> [1] "2025-07-31T00:00:00+02:00"
#> 
#> $keywords
#>           label.de         label.en                  label.fr
#> 1       Fallkosten       Fallkosten              Coût par cas
#> 2 Hospitalisierung Hospitalisierung          Hospitalisations
#> 3 Gesundheitswesen Gesundheitswesen          Système de santé
#> 4 Spitalleistungen Spitalleistungen Prestations hospitalières
#> 5      Spitaldaten      Spitaldaten     Données hospitalières
#>                    label.it
#> 1              Coût par cas
#> 2          Hospitalisations
#> 3          Système de santé
#> 4 Prestations hospitalières
#> 5     Données hospitalières
#> 
#> $landingPages
#>                                                                                                uri
#> 1 https://www.bfs.admin.ch/bfs/de/home/statistiken/gesundheit/gesundheitswesen/projekt-spiges.html
#> 
#> $languages
#>   code
#> 1   de
#> 2   fr
#> 3   it
#> 4   en
#>                                                                          uri
#> 1 https://www.loc.gov/standards/iso639-2/php/langcodes_name.php?iso_639_1=de
#> 2 https://www.loc.gov/standards/iso639-2/php/langcodes_name.php?iso_639_1=fr
#> 3 https://www.loc.gov/standards/iso639-2/php/langcodes_name.php?iso_639_1=it
#> 4 https://www.loc.gov/standards/iso639-2/php/langcodes_name.php?iso_639_1=en
#>       name.de name.en  name.fr  name.it
#> 1     Deutsch  German allemand  Tedesco
#> 2 Französisch  French français Francese
#> 3 Italienisch Italian  italien Italiano
#> 4    Englisch English  anglais  Inglese
#> 
#> $modified
#> [1] "2025-07-31T00:00:00+02:00"
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
#> $qualifiedAttributions
#> list()
#> 
#> $qualifiedRelations
#> list()
#> 
#> $registrationStatus
#> [1] "Recorded"
#> 
#> $relations
#> list()
#> 
#> $system
#> $system$createdAt
#> [1] "2025-07-24T05:39:20.729438+00:00"
#> 
#> $system$modifiedAt
#> [1] "2026-03-25T13:30:12.313897+00:00"
#> 
#> 
#> $spatial
#> list()
#> 
#> $temporalCoverage
#>                       start                       end
#> 1 2025-01-01T00:00:00+01:00 2025-12-31T00:00:00+01:00
#> 
#> $themes
#>   code               name.de             name.en              name.fr
#> 1  114            Gesundheit              Health                Santé
#> 2  125 Öffentliche Statistik Official statistics Statistique publique
#>               name.it
#> 1              Salute
#> 2 Statistica pubblica
#> 
#> $title
#> $title$de
#> [1] "SpiGes-Datensatz (Daten-File)"
#> 
#> $title$en
#> [1] "Set di dati SpiGes (file di dati)"
#> 
#> $title$fr
#> [1] "SpiGes-Fichier de données"
#> 
#> $title$it
#> [1] "SpiGes Administrative Erhebungsvariablen"
#> 
#> 
#> $version
#> [1] "1.5"
#> 
# }
```
