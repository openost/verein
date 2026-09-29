# Sponsoring

Details zum Sponsoring finden sich auf der [open\OST Webseite unter Sponsoring](https://www.open-ost.ch/sponsoring/).

Die Verträge sind mit einem symmetrischen GPG-Passwort verschlüsselt. Das Passwort ist in der ```pass```-Datenbank abgelegt (das gleiche wie für die Buchhaltung).

## Benutzung

```bash
# Entschlüsseln
gpgtar --decrypt ausgestellt.gpg

# Verschlüsseln
gpgtar --symmetric --encrypt --output ausgestellt.gpg ausgestellt_1_

# pdfs generieren
typst watch --root . sponsoring/vertrag/ausgestellt_1_/ausgestellt/sponsoringvertrag_SPONSOR.typ 
```
