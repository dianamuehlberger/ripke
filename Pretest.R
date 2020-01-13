# Skript Erstellung einfaches Netzwerk

# lädt igraph Bibliothek (ggf. vorher isntallieren)
library(igraph)

# liest die Edgelist als "el" ein
el <- read.csv("https://raw.githubusercontent.com/dianamuehlberger/ripke/master/Edgelist%20Ripke%20-%20Tabellenblatt1.csv", header=T, as.is=T, sep = ",")

# zeigt die ersten sechs Zeilen des Datensatzes an
head(el)

# liest die Nodelist mit den Namen ein
nodes <- read.csv("https://raw.githubusercontent.com/dianamuehlberger/ripke/master/Nodelist%20Ripke%20-%20Tabellenblatt1.csv", header=T, as.is=T, sep = ",")

# zeigt die ersten sechs Zeilen der Nodelist und die Attribute der Nodes an
head(nodes)

# Zwischenschritt verbindet die Edge- und Nodelist zu einer Matrix
ripke_matrix <- as.matrix(el)

# zeigt die Matrix an
ripke_matrix

# generiert ein igraph-Objekt (dataframe) aus der Matrix, das gerichtet ist (directed = true)
ripke <- graph_from_data_frame(d=ripke_matrix, vertices=nodes, directed=FALSE)

# ruft unser neues igraph-Objekt auf
ripke

# generiert die Standard-Visualisierung des Netzwerks
plot(ripke)

# Für Fortgeschrittene: verfeinerte Netzwerkdarstellung
# definiert einige grafische Elemente, damit wir diese nicht immer wieder eingeben müssen
#
E(ripke)$arrow.size <- .2
E(ripke)$color="darkblue"
E(ripke)$width <- E(ripke)$weight
E(ripke)$curved=.2
V(ripke)$color = "lightblue"
V(ripke)$frame.color = "white"
V(ripke)$label.dist = 3
V(ripke)$label.degree=6
V(ripke)$label.cex=.8
V(ripke)$label.family="Helvetica"
V(ripke)$label.font=1
V(ripke)$label.color="darkblue"

degree <- degree(ripke)
degree

# einfacher plot
plot(ripke,
     layout=layout_nicely(ripke,dim=2),
     main="Ripke Pretest")

