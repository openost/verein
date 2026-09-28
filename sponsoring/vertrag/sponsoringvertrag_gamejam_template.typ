#import "../../design/typst.typ": (
  bill-page, business-page, dateformat, format-company, logo-w-text, openost, openost-address,
  openost-template-business, sgkb-address, today, todo, urls,
)

// TODO: edit this
#let company = (
  name: "Firmenname",
  contact: (
    gender: "n",
    name: ("FirstName", "LastName"),
  ),
  address: (
    name: "",
    street: "Strasse",
    number: "X",
    plz: "PLZ",
    city: "Ort",
    country: "CH",
  ),
)
#let sponsoring = (
  amount: 500,

  // NOTE: and you are done. DO NOT TOUCH ANYTHING FROM HERE ON
  from: (datetime.today() + duration(days: 30)).display(dateformat),
  to: datetime(year: 2027, month: 06, day: 01).display(dateformat),
  name: "Game Jam",
)

#show: openost-template-business.with(
  company,
  "Sponsoringvertrag Game Jam",
)

Wir freuen uns sehr, euch im neuen Vereinsjahr als Sponsor begrüssen zu dürfen.

Im Anhang findest du unseren Sponsoringvertrag gemäss den Abmachungen per
E-Mail.

Wir freuen uns auf eine gute Zusammenarbeit!

Beste Grüsse \
#openost Vorstand

#pagebreak()

= Vertrag

Zwischen #openost und #company.name.

Weitere Informationen zu den Sponsoringleistungen können der #openost Webseite
unter #urls.sponsoring entnommen werden.

== Vereinbarte Leistung

Leistungen der #openost beinhalten:

- 1 Logo mit Verlinkung auf ihre URL im Footer auf folgenden Seiten:
  - Game Jam Infoseite: #urls.game-jam (bis 01.06.2027)
  - Vereinswebseite: #urls.open-ost (bis 01.12.2026)
- 1 Logo auf dem Game Jam Flyer
- 1 Logo auf der Einführungspräsentation und Danksagung

Es besteht damit eine Sponsoring-Verpflichtung von CHF #(sponsoring.amount).-.

== Konditionen

- Der vereinbarte Betrag ist vor Inkrafttreten der Vertragslaufzeit an den
  #openost zu entrichten.
- Der Vertrag bezieht sich nur auf die hier festgelegten Verpflichtungen und
  Kosten. Weitere Verpflichtungen und Kosten sind ausgeschlossen.
- Nach Ablauf der Laufzeit wird der Vertrag automatisch nichtig. Bei Wunsch auf
  eine Verlängerung wird ein neuer Vertrag ausgestellt.
- Bei vorzeitigem Abbruch des Vertrags werden keine Kosten zurückerstattet und
  die Pflichten des #openost bleiben für die gesamte Laufzeit bestehen.

== Laufzeit des Vertrags

Der Vertrag tritt beim Begleichen des vereinbarten Betrags in Kraft und erlischt am #sponsoring.to.

#bill-page(company, [Rechnung Sponsoring #openost], sponsoring)
