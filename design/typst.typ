#let colors = (
  c0: rgb("#D72964"),
  c1: rgb("#8C195F"),
  c2: rgb("#191919"),
  c3: rgb("#FFFFFF"),
)

#let fonts = (
  f0: "Ubuntu Sans",
  f1: "JetBrainsMono NF",
  f2: "Libertinus Serif",
)

#let urls = (
  open-ost: link("https://www.open-ost.ch", "open-ost.ch"),
  sponsoring: link(
    "https://www.open-ost.ch/sponsoring",
    "open-ost.ch/sponsoring",
  ),
  game-jam: link("https://game-jam.open-ost.ch", "game-jam.open-ost.ch"),
  studentenportal: link("https://www.studentenportal.ch", "studentenportal.ch"),
)

#let openost = text(font: "Ubuntu Sans", fill: colors.c2)[open\\OST]
#let today = datetime.today().display("[day].[month].[year]")
#let todo(it) = {
  box(fill: colors.c0.lighten(50%), inset: 5pt)[
    *TODO:*

    #it
  ]
}

#let fit-text-w(body) = layout(size => {
  let font_size = text.size
  let (width,) = measure(
    text(size: font_size)[#body],
  )
  let max_width = size.width
  while width < max_width {
    font_size += 0.1pt
    width = measure(
      text(size: font_size)[#body],
    ).width
  }
  text(size: font_size - 0.1pt)[#body]
})

#let logo(size) = {
  let (c0, c1, c2) = colors
  let arc = (start, stop, r, ..args) => {
    let (fst, ..pts) = range(int((stop - start).deg())).map(x => {
      let a = start.rad() + (x * 1deg).rad()
      (
        r * calc.cos(a),
        r * calc.sin(a),
      )
    })
    curve(
      ..args,
      curve.move(fst),
      ..pts.map(curve.line),
    )
  }
  let s = (thickness: size * .101, cap: "round")
  let p = size / 2
  box(width: size, height: size, {
    place(dx: p, dy: p, arc(0deg, 270deg, p, stroke: (..s, paint: c2)))
    place(dx: p, dy: p, arc(45deg, 315deg, p * .8, stroke: (..s, paint: c1)))
    place(dx: p, dy: p, arc(90deg, 360deg, p * .6, stroke: (..s, paint: c0)))
  })
}

#let logo-w-text(height) = {
  grid(
    columns: 2,
    gutter: height / 10,
    logo(height),
    box(height: height, align(center + horizon, [
      #set text(font: "Ubuntu Sans")
      #text(size: height * .55)[OPEN] \
      #text(size: height * .725)[*OST*]
    ])),
  )
}

#let template-base(title: "", author: "open\OST", lang: "de", body) = {
  let (c0, c1, c2, c3) = colors

  set document(
    author: author,
    title: title,
    date: datetime.today(),
  )

  show heading: set text(fill: c2, lang: lang, region: if lang == "de" { "ch" })
  set page("a4")

  set text(fill: c2, lang: lang, region: if lang == "de" { "ch" })
  show link: it => box(text(fill: c0, size: .9em, it))

  body
}

#let openost-template(title: "", author: "open\OST", lang: "de", body) = {
  show: template-base.with(title: title, author: author, lang: lang)
  let (f0, f1) = fonts

  show heading: set text(font: f0)
  set text(font: f1)

  body
}

#let official-title-page(title: "", subtitle: none) = {
  set page(margin: 30mm)

  page[
    #set align(center)

    #text(size: 1.5em)[*#openost*]

    #text(size: 3em)[*#title*]

    #v(2em)

    #text(size: 1.5em)[Stand: #today]

    #v(2em)

    #logo-w-text(100pt)

    #v(1fr)

    #if subtitle != none [
      #subtitle
    ]

    #v(4em)

    #grid(columns: (1fr, 1fr, 1fr), gutter: 4em, inset: .5em, stroke: (
        top: .5pt + colors.c2,
      ))[
      Georgiy Shevoroshkin\ Präsident
    ][
      Jasmin Fässler\ Vize-Präsidentin
    ][
      Filippo Andretta\ Kassierer
    ]
  ]
}

#let openost-template-official(
  title: "",
  author: "open\OST",
  lang: "de",
  title-page: true,
  title-page-title: none,
  title-page-content: none,
  body,
) = {
  show: template-base.with(title: title, author: author, lang: lang)
  let (f2,) = fonts

  show heading: set text(font: f2)
  set text(font: f2)

  set heading(numbering: "1")
  show heading: it => [
    § #counter(heading).display() -- #it.body
  ]
  set enum(
    numbering: (..it) => context if it.pos().len() > 2 [
      #numbering("i.", ..it.pos().slice(2))
    ] else [
      #counter(heading).display().#it.pos().map(x => [#x]).join([.])
    ],
    full: true,
    spacing: 1em,
  )

  if title-page {
    official-title-page(
      title: if title-page-title == none { title } else { title-page-title },
      subtitle: title-page-content,
    )
  }

  set page(
    header: [
      #title #h(1fr) Stand: #today
      #v(-.8em)
      #line(length: 100%, stroke: colors.c2 + .5pt)
    ],
    footer: context align(center)[Seite #counter(page).display() von #(
        counter(page).final().first()
      )],
  )

  body
}

#let sgkb-address = (
  name: "St. Galler Kantonalbank",
  contact: (
    gender: "m",
    name: ("",),
  ),
  address: (
    street: "St. Leonhardstrasse",
    number: "25",
    plz: "9001",
    city: "St. Gallen",
    country: "CH",
  ),
)

#let openost-address = (
  name: "Verein open\OST",
  contact: (
    gender: "m",
    name: ("Georgiy", "Shevoroshkin"),
  ),
  address: (
    name: "OST - Ostschweizer Fachhochschule",
    street: "Oberseestrasse",
    number: "10",
    plz: "8640",
    city: "Rapperswil",
    country: "CH",
  ),
  banking: (
    iban: "CH1300781621198572000",
  qriban: "CH3530781621198572000"
  ),
)

#let format-address(addr, show-country: false) = [
  #if "name" in addr {
    addr.name
  } \
  #addr.street #addr.number \
  #addr.plz #addr.city \
  #if show-country { addr.country }
]

#let format-company(company, show-name: true, bold-company: true) = {
  let (name, contact, address) = company
  [
    #if bold-company [
      *#name*

    ] else [ #name \ ] #if show-name { contact.name.join([ ]) }
    #if bold-company [


    ] #format-address(address)
  ]
}

#let business-page(
  company: (
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
      country: "Land",
    ),
  ),
  title: "Titel",
  body,
) = {
  grid(
    columns: (1fr, auto),
    format-company(company), format-company(openost-address),
  )

  v(2em)

  align(right)[*Rapperswil, #today*]

  [
    = #title
  ]

  body
}

#let openost-template-business(
  title: "",
  author: "open\OST",
  lang: "de",
  company: (
    name: "Firmenname",
    contact: (
      gender: "n",
      name: ("FirstName", "LastName"),
    ),
    address: ("Strasse X", "PLZ Ort", "Land"),
  ),
  body,
) = {
  show: template-base.with(title: title, author: author, lang: lang)

  show heading: set block(below: 1em)

  set table(stroke: (x, y) => (
    top: if y == 1 { colors.c2 } else if y > 1 {
      colors.c2.lighten(60%)
    },
  ))

  let (f0,) = fonts

  show heading: set text(font: f0)
  set text(font: f0)

  set page(
    margin: (top: 4cm, x: 2.5cm, bottom: 2cm),
    header: grid(
      align: horizon,
      columns: (1fr, auto),
      [
        #set text(size: 1.25em)
        #title \
        Verein #openost
      ],
      logo-w-text(1.5cm),
    ),
    footer: context align(center)[#counter(page).display() -- #(
        counter(page).final().first()
      )],
  )

  show: business-page.with(title: title)

  [
    Lieb#if company.contact.gender == "n" [e\*r] else if (
      company.contact.gender == "f"
    ) [e] else [er] #company.contact.name.join([
    ])
  ]

  body
}
