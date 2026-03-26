// Site template
#let template(current-page: none, doc) = {
  context if target() == "html" {
    html.elem("nav", attrs: (class: "site-nav"))[
      #let cls = if current-page == "index" { "site-title active" } else { "site-title" }
      #html.elem("a", attrs: (href: "./index.html", class: cls))[Digital Theory Lab]
      #html.elem("input", attrs: (type: "checkbox", id: "nav-toggle", class: "nav-toggle"))[]
      #html.elem("label", attrs: ("for": "nav-toggle", class: "nav-hamburger"))[☰]
      #let pages = (
        (id: "research", title: "Research", file: "./research.html"),
        (id: "people",   title: "People",   file: "./people.html"),
        (id: "events",   title: "Events",   file: "./events.html"),
      )
      #html.elem("ul")[
        #for p in pages {
          let cls = if p.id == current-page { "active" } else { "" }
          html.elem("li", attrs: (class: cls))[
            #link(p.file)[#p.title]
          ]
        }
      ]
    ]
    html.elem("hr")
  }
  doc
}

#let person(name, role: none, url: none, affiliation: none) = {
  context if target() == "html" {
    html.elem("div", attrs: (class: "person"))[
      #let linked-name = if url != none [#link(url)[#name]] else [#name]
      #html.elem("strong", attrs: (class: "person-name"))[#linked-name]
      #if role != none or affiliation != none {
        let meta = if role != none and affiliation != none [#emph(role) · #affiliation]
                   else if role != none [#emph(role)]
                   else [#affiliation]
        html.elem("span", attrs: (class: "person-meta"))[#meta]
      }
    ]
  } else {
    let linked-name = if url != none [#link(url)[#name]] else [#name]
    [*#linked-name*\ ]
    if role != none or affiliation != none {
      let meta = if role != none and affiliation != none [#emph(role) · #affiliation]
                 else if role != none [#emph(role)]
                 else [#affiliation]
      text(fill: luma(96), size: 0.88em, meta)
    }
  }
}

#let event(speaker, date: none, url: none, body) = {
  context if target() == "html" {
    html.elem("div", attrs: (class: "event"))[
      #html.elem("div", attrs: (class: "event-meta"))[
        #if date != none [
          #html.elem("span", attrs: (class: "event-date"))[#date]
        ]
        #if url != none [*#link(url)[#speaker]*] else [*#speaker*]
      ]
      #body
    ]
  } else {
    if date != none [*#date* --- ]
    if url != none [#link(url)[*#speaker*]] else [*#speaker*]
    linebreak()
    body
  }
}

#let render-event(e) = {
  let url = if "url" in e { e.url } else { none }
  let title = if "title" in e and e.title != "" { e.title } else { none }

  let date = e.date.display("[month repr:long] [day], [year]")

  #event(e.speaker, date: date, url: url)[
    #if title != none { [#title] }
  ]
}

#let get-unique-years(xs) = {
  let out = ()
  for x in xs {
    if not out.contains(x) { out.push(x) }
  }
  out
}

