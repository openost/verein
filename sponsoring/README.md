# Sponsoring

Details zum Sponsoring finden sich auf der [open\OST Webseite unter Sponsoring](https://www.open-ost.ch/sponsoring/).

Die Verträge sind mit einem symmetrischen GPG-Passwort verschlüsselt. Das Passwort ist in der ```pass```-Datenbank abgelegt (das gleiche wie für die Buchhaltung).

## Benutzung (aus root dir)

```bash
# Entschlüsseln
gpgtar --decrypt --directory sponsoring/vertrag sponsoring/vertrag/ausgestellt.gpg

# Verschlüsseln
gpgtar --symmetric --encrypt --output sponsoring/vertrag/ausgestellt.gpg sponsoring/vertrag/ausgestellt

# pdfs generieren
typst watch --root . sponsoring/vertrag/ausgestellt/sponsoringvertrag_SPONSOR.typ 
```
