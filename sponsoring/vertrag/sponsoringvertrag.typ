#import "../../design/typst.typ": (
  bill-page, business-page, format-company, logo-w-text, openost, openost-address, openost-template-business,
  sgkb-address, today, todo, urls, dateformat
)

#let vertrag(company, sponsoring) = [

  #let sponsor-options = (
    supporter: (
      "Supporter",
      500,
      [
        - 1 Logo auf der #openost Webseite #urls.open-ost
      ],
    ),

    sponsor: (
      "Sponsor",
      1500,
      [
        _Zusätzlich:_
        - 1 Logo auf der Webseite des Studentenportals #urls.studentenportal
      ],
    ),

    hauptsponsor: (
      "Hauptsponsor",
      2000,
      [
        _Zusätzlich:_
        - 1 Banner/Logo an #{ openost }-Events\*
        - 1 Logo auf #{ openost }-Flyer
      ],
    ),
  )

  #let selected-option = sponsor-options.at(sponsoring.sla)

  #show: openost-template-business.with(
    company,
    "Sponsoringvertrag",
  )

  Wir freuen uns sehr, euch im neuen Vereinsjahr als Sponsor begrüssen zu dürfen.

  Im Anhang findest du unseren Sponsoringvertrag gemäss den Abmachungen per
  E-Mail. Wir wären froh, wenn du ein Exemplar unterschrieben wieder an uns
  retournieren könntest. Herzlichen Dank!

  Wir freuen uns auf eine gute Zusammenarbeit!

  Beste Grüsse \
  #openost Vorstand

  #pagebreak()

  = Vertrag

  Zwischen #openost und #company.name.

  == Optionen

  #{
    show table.cell.where(y: 0): set text(weight: "bold")
    table(
      columns: (auto, auto, 1fr),
      table.header[Kategorie][Kosten CHF/Jahr][Leistungen #openost],
      ..sponsor-options.values().map(((n, b, l)) => (n, [#{ b }.-], l)).join(),
    )
  }
  #text(size: .75em)[_\*Banner muss vom Sponsor zur Verfügung gestellt werden.
  Logo wird vom Verein ausgedruckt._]

  Weitere Informationen zu den Sponsoringleistungen können der #openost Webseite
  unter #urls.sponsoring entnommen werden.

  == Vereinbarte Leistung

  Sponsoring der Kategorie #selected-option.at(0). Damit besteht eine
  Sponsoring-Verpflichtung von CHF #(selected-option.at(1)).-.

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

  Der Vertrag tritt am #sponsoring.from in Kraft und erlischt am #sponsoring.to.

  #{
    show table.cell.where(y: 0): set text(weight: "bold")
    table(
      columns: (1fr, 1fr),
      rows: (auto, 4em, auto),
      table.header[Ort, Datum][Ort, Datum],
      [
      ],
      [
      ],

      [
        #openost-address.name \
        #openost-address.contact.name.join[ ]
      ],
      [
        #company.name \
        #company.contact.name.join[ ]
      ],
    )
  }

  #bill-page(company, [Rechnung Sponsoring #openost], (
    ..sponsoring,
    name: selected-option.at(0),
    amount: selected-option.at(1),
  ))
]
