install.packages("skimr")
library(skimr)
data <- read.csv("Crashs/data/Crash_Reporting_-_Drivers_Data.csv")
skim(data)
head(data)
str(data)
summary(data)
unique(data$Driverless.Vehicle) #Unwichtig
unique(data$Parked.Vehicle) #Logical
unique(data$Related.Non.Motorist) #Gruppieren
unique(data$Collision.Type) #Gruppieren
unique(data$Weather)#Gruppieren
unique(data$Surface.Condition)#Gruppieren
unique(data$Light) #Gruppieren
unique(data$Traffic.Control) #Gruppieren
unique(data$Driver.Substance.Abuse) #Gruppieren
unique(data$Non.Motorist.Substance.Abuse)#Gruppieren
unique(data$Injury.Severity)#Gruppieren
unique(data$Driver.Distracted.By)#Gruppieren
unique(data$Vehicle.Damage.Extent)#Gruppieren
unique(data$Vehicle.First.Impact.Location)#Gruppieren
unique(data$Vehicle.Body.Type)#Gruppieren
unique(data$Vehicle.Movement)#Gruppieren
unique(data$Vehicle.Going.Dir)#Gruppieren
unique(data$Vehicle.Make)#Gruppieren
unique(grep("Volk", data$Vehicle.Make, value=TRUE, ignore.case = TRUE))
unique(data$Vehicle.Year)#Bereinigen
#Reihen: 204688, Spalten: 39
#alles unterschiedliche Personen -> Anzahl uniquer Person.ID = Reihenanzahl, alles unterschiedliche Autos
#Typen: character: 35, numeric: 4
#Unwichtig: Report.Number, Local.Case.Number, Driverless.Vehicle(No oder unkown), Vehicle.Model (zu divers)
#kategorisch: ACRS.Report.Type, Driver.At.Fault
#logical: Parked.Vehicle
#fehlende Werte: Parked.Vehicle (empty: 1526), Route.Type (20503), Road.Name (23510), Cross.Street.Name(36752), Off.Road.Description(185690), Municipality(48508), Related.Non.Motorist(198036), Traffic.Control(3015), Surface.Condition(19149), Non.Motorist.Substance.Abuse(198036), Injury.Severity(2164), Circumstance(24467), Driver.Distracted.By(2336), Drivers.License.State(13659), Vehicle.First.Impact.Location (156),Vehicle.Body.Type (2910), Vehicle.Movement(1095), Vehicle.Going.Dir(8396), Vehicle.Make(913), Vehicle.Model(930)
#Gruppieren: Related.Non.Motorist, Collision.Type, Weather, Surface.Condition, Light, Traffic.Control, Driver.Substance.Abuse, Non.Motorist.Substance.Abuse, Injury.Severity, Driver.Distracted.By, Vehicle.Damage.Extent, Vehicle.First.Impact.Location, Vehicle.Body.Type, Vehicle.Movement, Vehicle.Going.Dir, Vehicle.Make
#Umwandeln: Crash.Date.Time(chr), Vehicle.First.Impact.Location (chr in time?), Location(/Latitude&Longitude)?
#Bereinigen: Vehicle.Year
