#import "site.typ": template, person
#import "data/people.typ": people
#show: template.with(current-page: "people")

== Founding Director 

#person(
  "Leif Weatherby",
  role: "Associate Professor, German",
  url: "https://as.nyu.edu/faculty/leif-allison-reid-weatherby.html", 
  institution: "New York University"
)

== Director 

#person(
  "Tyler Shoemaker",
  role: "Assistant Professor, English",
  url: "https://tylershoemaker.info",
  institution: "Texas A&M"
)

#let last-name(p) = p.name.split(" ").last()
#let sorted = people.sorted(key: p => last-name(p))

#let render-group(title, key) = [
  == #title
  #for p in sorted.filter(p => p.affiliation == key) [
    #person(
      p.name,
      role: p.role,
      url: p.at("url", default: none),
      institution: p.institution,
    )
  ]
]

#render-group("Team", "team")
#render-group("Graduate Students", "grad")
#render-group("Affiliates", "affiliate")

