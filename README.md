# M300 LB2, Samba Fileserver mit Vagrant

## Inhaltsverzeichnis

- [Einleitung](#einleitung)
- [Wie sieht die Umgebung aus?](#wie-sieht-die-umgebung-aus)
	- [Shares](#shares)
	- [Thema 2](#thema2)
	- [Thema 3](#thema3)	
- [Schluß](#schluss)

---

<a name="einleitung"></a>
## Einleitung

In dieser LB2 vom Modul 300 (Plattformübergreifende Dienste in ein Netzwerk integrieren) schauen wir Vagrant an. Die Dokumentation schreiben wir mit Markdown. Das Ziel der LB2 ist es, anhand von Vagrant, eine Service Funktion mit mehreren VMs oder Services aufzusetzen. In unserem Fall haben wir zwei VMs aufgesetzt. Eine Servermaschine für den SMB Fileserver und einen Client, der darauf zugreifen kann. Der Dienst ermöglicht Geräten, innerhalb eines Netzwerkes, auf geteilte Dateien zuzugreifen und Berechtigungen über Ordner/Dateien zu kontrollieren.

>### Voraussetzungen
- Die neuste Version von Virtualbox muss installiert sein
- Auf Virtualbox dürfen keine VMs vorhanden sein, die entweder "LB-Fileserver" oder "LB-Client" heissen
- Vagrant muss installiert sein
- PC mit min. 8 GB freiem RAM und ca. 20 GB freiem Speicher

---

<a name="wie-sieht-die-umgebung-aus"></a>
## Wie sieht die Umgebung aus?

Die Umgebung beinhaltet einen Fileserver, welcher zwei SMB Shares im ganzen beinhaltet. Ebenfalls gibt es einen Client, mit welchen man auf die Shares zugreifen kann.

![M300-Banner](lb2-env.png)

<a name="shares"></a>
### Shares
- **LB-User Share:**
auf diesen Share kann nur der User lb-user zugreifen. Dazu braucht man dessen Benutzernamen und Passwort und jedem anderen wird der Zugriff verwährt. In diesem Share wird nur der lb-user Dateien erstellen und löschen können und überhaupt auf den Share zugreifen können.
> **NOTE:** Username und Passwort werden noch angegeben

- **Public Share:**
auf diesen Share kann jeder zugreifen. Hier wird kein Account benötigt und jeder hat die Authorität dazu, Dateien und Ordner in diesem Share zu löschen

---

## Umgebung hochstarten, herunterfahren, ...

### Hochfahren:

Um die Umgebung hoch zufahren, muss man im Terminal im **gleichen Ordner wie das Vagrantfile** sein und **vagrant up** eingeben. Dies dauert eine Weile, da es die Nötigen Daten herunterladet und die VMs erstellt und konfiguriert.

### Herunterfahren:

Wenn man nun die Umgebung herunterfahren möchte, muss man im Terminal im **gleichen Ordner wie das Vagrantfile** sein und **vagrant halt** eingeben.

### Umgebung vom Gerät löschen:

Um die Umgebung vom Gerät nun zu löschen, muss man im Terminal im **gleichen Ordner wie das Vagrantfile** sein und den Befehl **vagrant destroy** eingeben. 
> **NOTE:** Man muss bei den Maschinen die beide Male **"y"** eingeben, um zu bestätigen, dass man die VMs auch wirklich löschen will.

### Befehl-Tabelle Vagrant:

|Befehl    |Command (im Terminal)                    |
|-------------------------|--------------------------|
|hochfahren / erstellen   |`vagrant up`              |
|herunterfahren           |`vagrant halt`            |
|löschen                  |`vagrant destroy`         |
 
## Via SSH auf die VMs zugreifen:

Um auf die einzelnen VMs zuzugreifen, muss man lediglich im Terminal im **gleichen Ordner wie das Vagrantfile** sein und den Befehl **vagrant ssh "Maschine"** eingeben.

|Welche Maschine  |Command (im Terminal)              |
|-----------------|-----------------------------------|
|Fileserver       |`vagrant ssh ubuntuserver`         |
|Client           |`vagrant ssh ubuntuclient`         |

## Benutzernamen & Passwörter

### SSH

Auf dem LB-Fileserver sowie auf dem Ubuntuclient sind die SSH User Vagrant.
- Benutzername: vagrant
- Passwort: vagrant

### SAMBA

Um auf den privaten Samba Share zugreifen zu können, braucht es einen privaten Benutzer: "lb-user"
- Benutzername: lb-user
- Passwort: password 

## Zugreifen auf den privaten Share

Zugreifen auf den Samba Share via Ubuntuclient Terminal:

|welcher Share    |Command (im Terminal)                                    |
|-----------------|---------------------------------------------------------|
|privaten Share   |`smbclient //192.168.10.5/lb-user -U lb-user`              |
|public Share     |`smbclient //192.168.10.5/public`                        |
|Allgemein        |`smbclient //*IP Adresse*/*Ordner* -U *Benutzername*`    |

## Exit

### Aus Sambashare

Um den Share zu verlassen, in welchen man sich eingeloggt hat, muss man nur einen Befehl eingeben:
> exit

### Aus SSH

Um die SSH Verbindung (im Terminal von z.B. Visual Studio Code,...) zu trennen, muss man lediglich einen Befehl eingeben:
> exit
