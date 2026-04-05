#import "site.typ": template, person, render-people
#import "data/people.typ": people, groups
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
  institution: "Texas A&M University"
)

#render-people(groups, people)

