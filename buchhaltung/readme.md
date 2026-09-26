Die Buchhaltung ist mit einem symmetrischen GPG-Passwort verschlüsselt. Das Passwort ist in der ```pass```-Datenbank abgelegt.

## Benutzung

Die Buchhaltung kann nach dem entschlüsseln mittels der ledger Software (https://ledger-cli.org/) geöffnet werden.

```bash
# Entschlüsseln
gpg2 --output buchhaltung_2026-2030.dat --decrypt buchhaltung_2026-2030.dat.gpg

# Verschlüsseln
gpg2 --symmetric buchhaltung_2026-2030.dat
```


## Legacy

Die Buchhaltung kann nach dem entschlüsseln mittels der Banana Software (www.banana.ch) geöffnet werden.

```bash
# Entschlüsseln
gpg2 --output buchhaltung_2019-2020.ac2 --decrypt buchhaltung_2019-2020.ac2.gpg

# Verschlüsseln
gpg2 --symmetric buchhaltung_2019-2020.ac2
```

