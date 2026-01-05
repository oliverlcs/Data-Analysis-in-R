# Template-Notizen (aus analysis.qmd entfernt)

Diese Notizen wurden aus analysis.qmd entfernt, da sie nicht zum Projekt gehören.

---

### Kopie

df_raw <- df # Original behalten
df <- df_raw %>% as_tibble() # Arbeitskopie

### Konvertieren der Datentypen

Numerisch:
df <- df %>% mutate(
  Alter = as.numeric(Alter),
  Einkommen = parse_number(Einkommen) # entfernt Währungssymbole
)

Datum/Zeit: Wenn Format "dd.mm.yyyy":
df <- df %>% mutate(Datum = dmy(Datum))

Falls ISO "YYYY-MM-DD":
df <- df %>% mutate(Datum = as.Date(Datum))

Faktor/kategorial:
df <- df %>% mutate(Geschlecht = factor(Geschlecht, levels = c("male","female","other")))

### Trimmen/Case-Normalization

df <- df %>%
  mutate(across(where(is.character), ~ trimws(.))) %>%
  mutate(across(where(is.character), ~ str_to_lower(.)))

### Duplikate entfernen/prüfen

Identische Zeilen entfernen:
df <- df %>% distinct()

Falls Duplikate nach id mit neuer Zeitstempel behalten:
df <- df %>% arrange(id, desc(timestamp)) %>% distinct(id, .keep_all = TRUE)

### Subsetting/Filter

Entfernen von irrelevanten Zeilen:
df <- df %>% filter(!is_test_record & !is.na(id))

Oder nur Beobachtungen nach Datum:
df <- df %>% filter(Datum >= as.Date("2020-01-01"))

### Kein Join -> nur eine Tabelle

### Feature Engineering & Ableiten von Variablen

df <- df %>% mutate(
  year = year(Datum),
  month = month(Datum),
  revenue = price * quantity
)

### Outlier-Check/Plausibilität

einfache stats:
df %>% summarise(across(where(is.numeric), list(
  min = min,
  p25 = ~quantile(.x, .25, na.rm=TRUE),
  median = median,
  mean = mean,
  p75 = ~quantile(.x, .75, na.rm=TRUE),
  max = max
), .names = "{col}_{fn}"))

oder visual: boxplots (einfach):
boxplot(df$Einkommen, outline = TRUE)

### Fehlende Werte behandeln

Kleine NA-Anteile: entfernen (drop_na)

Für numerische: median/mean/knn/impute model-based

Für kategorial: eigener Level "missing" oder modus

### Qualitätscheck

glimpse(df)
skim(df)
head(df, 20)

NA-Check:
colSums(is.na(df))

Unique counts für kategorische Felder:
df %>% summarise(across(where(is.factor), ~ n_distinct(.)))
