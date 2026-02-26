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

#show: template.with(current-page: "index")

= Digital Theory Lab

Digital technologies permeate our culture today, leaving virtually no area of meaning-making untouched. Vast social media platforms struggle to cope with the political consequences of their own scale, economics increasingly acknowledges a new type of capital in digital data, and artificial intelligence has gained an infrastructural role in our societies through the help of planetary-scale computing.

The Digital Theory Lab seeks to develop and maintain the broad-based, interdisciplinary conceptual framework necessary for understanding and transforming the way we live in and with the digital.

Employing a workshop-based, collaborative learning approach to the history and theory of the digital, the Lab fosters projects and writing that contribute to a theoretical framework for understanding the nature of the digital. We have a particular focus on machine learning and the new AI, including neural nets and large language models. Some results have been published in _Critical Inquiry_, and the Lab maintains a regular local meeting schedule as well as a talk and works-in-progress series in hybrid format with our international affiliates.

