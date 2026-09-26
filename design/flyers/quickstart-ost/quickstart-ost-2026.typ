#import "../../typst.typ": colors, fit-text-w, logo, logo-w-text, openost-template, urls
#show: openost-template.with(title: "Quickstart Guide")

#set page(margin: 1.25cm)

#place(dx: 92%, dy: 23%, logo(250pt))
#place(dx: -90pt, dy: 70%, logo(300pt))
#place(
  dx: -.3cm,
  dy: 80%,
  box(width: 5cm, height: 5cm, align(center + horizon, [
    #text(size: 2em)[Jetzt Mitglied werden!] \
    #text(size: .9em)[Natürlich unverbindlich und kostenlos] \
    #urls.open-ost
  ])),
)

#grid(
  columns: (2.5fr, 3fr),
  column-gutter: 1em,
  row-gutter: 2em,
  align(horizon, logo-w-text(100pt)),
  align(horizon)[
    #set text(font: "Ubuntu Sans")
    #fit-text-w[Quickstart Guide] \
    #fit-text-w[für Linux und macOS an der OST]
  ],

  [
    == WLAN

    #grid(
      gutter: 1em,
      columns: (1fr, 1fr),
      [SSID], [eduroam],
      [Security], [WPA2 Enterprise],
      [Authentisierung], [PEAP],
      [CA-Zertifikat], [Keines],
      [Innere-Auth.], [MSCHAPv2],
      [], [],
      [Benutzername], [max.muster\@ost.ch],
      [Passwort], range(8).map(_ => math.circle.filled).join(),
    )

    Weitere Infos zum Aufsetzen des WLANs auf Linux/MacOS
    https://wiki.ost.ch/x/toDS

    == VPN

    Manche Dienste der OST sind nur in deren internen Netzwerken zugänglich. Ist
    man nicht an einem OST-Campus, so kann man per VPN zu diesem Netzwerk
    verbinden. \
    Für VPN-Verbindungen muss auf dem OST-Account 2-Faktor-Auth aktiviert sein.
    Siehe https://wiki.ost.ch/display/IOW/VPN+OST
  ],
  [
    == Studentenportal

    Der Zentrale Ort für Wissensverwaltung: von Studierenden, für Studierende.
    Für kommende Events, wertvolle Tipps, Zusammenfassungen und alte Prüfungen
    oder einfach nur zur Aufheiterung während\ einer Vorlesung, schau vorbei auf
    #urls.studentenportal

    == OST-Account

    === Passwort

    Das Passwort des OST-Accounts ist\ änderbar auf
    https://wiki.ost.ch/change-password

    === Profilbild

    Dein Profilbild und weitere\ Profilangaben änderbar unter
    https://ostch-my.sharepoint.com/person.aspx

    == E-Mail

    Der Exchange-Server der OST bietet nur das proprietäre EWS-Protokoll an, das
    ausser von MS Outlook nur von wenigen Mail-Clients (z.B. Evolution)
    unterstützt wird. Die von quasi allen Mail-Clients unterstützten Protokolle
    SMTP und IMAP sind auf der Exchange-Instanz der OST "aus Sicherheitsgründen"
    abgeschaltet.

    #grid(
      gutter: 1em,
      columns: (1fr, 3fr),
      [Linux], [Evolution mit EWS-Plugin],
      [macOS], [Microsoft Outlook],
      [Webmail], [https://outlook.com],
    )

    Falls du deinen E-Mail-Client frei wählen können willst, tritt dem open\OST
    bei, der sich für Interoperabilität, Plattform-Unabhängigkeit und den
    Einsatz offener, freier Protokolle an der OST einsetzt.

    == Und Mehr...

    Linux-Anleitungen der OST-IT findest du unter
    https://wiki.ost.ch/display/public/IOW/Linux
  ],
)
