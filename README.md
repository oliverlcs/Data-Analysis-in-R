# Termine & allg. Informationen

## Deadlines
Mo., 01. Dez.: 95% Fertig -> mit Dietzsch besprechen
Mo., 08. Dez.: 100% Fertig -> mit Dietsch besprechen
Mi., 31. Dez.: späteste Abgabe
Mi., 14. Jan.: offizieller Abgabetermin

## Data origin
- https://www.kaggle.com/datasets/jockeroika/life-style-data/data

## Verwendeter Datensatz:
- Final_data.csv

## Abgabeformat

Abzugeben ist ein Zip-Archiv, dass den Datensatz, alle verwendeten Quelldateien, d.h. R-Skripte ( .R / .r ), die Quarto- bzw. R-Markdown-Files ( .qmd / .Rmd ), eventuell verwendete Datenbank-Files ... etc., sowie die zugehörigen fertig gerenderten .html -Files enthält. Wer möchte kann den Report auch noch als statische PDF-Version
hinzufügen

## Aufbau des Reports/Berichts nach Aufgabenstellung

1. Definition/Formulierung der Fragestellung (10 Pkt.)

Definieren Sie eine Sie interessierende bzw. interessante Fragestellung im Zusammenhang
mit dem Datensatz

   - Was interessiert Sie an dem Datensatz?
   - Welche spezifische Fragestellung würden Sie gern mit Hilfe des Datensatzes beantworten?
   - Was erwarten Sie, angesichts Ihrer Fragestellung, bezüglich des Datensatzes?


2. Laden der Daten (10 Pkt.)

   - Welche Typen sind enthalten?
   - Ist sichergestellt, dass alle Daten den richtigen Typ haben?
   - Haben die Daten irgendwelche "Seltsamkeiten" mit denen Sie umgehen müssen, wie z.B. anders codierte NA 's, mehrere Tabellen, ... etc.
   - Je nach Datensatz können Sie die Daten auch in eine Datenbank laden und dann auf diese in R zugreifen. (Bitte nicht)
   - Beschreiben Sie, was Sie tun müssen, bevor Sie die Daten im nächsten Abschnitt aufbereiten und bearbeiten können!

Beschreiben Sie, was Sie tun müssen, bevor Sie die Daten im nächsten Abschnitt
aufbereiten und bearbeiten können!


3. Bearbeiten/Transformieren der Daten (15 Pkt.)

In diesem Abschnitt sollten Sie alle notwendigen Transformationen/Bereiningungen/... etc. der Daten vornehmen (Data Muning, Data Cleansing), wie z.B.: 

   - Umcodierung von Daten, z.B. numerisch in kategorial 
   - Subsetting der Daten 
   - Joining von Datentabellen - falls nötig. Welcher Join ist notwendig? Warum? ...

Verschaffen Sie sich eine Übersicht der transformierten Daten. Sie können hierzu
Hilfsmittel wie glimpse() , skim() und head() benutzen, um Ihre Erläuterungen zu
veranschaulichen.

Sind die sich ergebenden Daten so, wie Sie es erwartet haben? Warum oder warum nicht?


4. Geeignete Visualisierung und Aggregation der Daten (15 Pkt.)

Fassen Sie die Daten in einer geeigenten Form zur Beantwortung Ihrer formulierten Fragestellung zusammen. Ziehen Sie auch geeignete Visualisierungen der transformierten und/oder aggregierten Daten heran, um Ihre Aussagen entsprechend zu untermauern
oder zu veranschaulichen.

Hier können Sie auch geeignete statistische Verfahren bzw. Modellierungen nutzen, falls
diese Ihnen bezüglich Ihrer Fragestellung weiterhelfen.


5. Zusammenfassung und Schlussfolgerung (10 Pkt.)

Fassen Sie hier Ihre Fragestellung und Ihre Erkenntnisse aus Ihrer Analyse zusammen.

Sind Ihre Erkenntnisse das, was Sie erwartet haben? Warum oder warum nicht?


6. Quellenverzeichnis