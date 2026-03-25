#import "site.typ": template, event
#import "data/events.typ": events
#show: template.with(current-page: "events")

= Events

#let render-item(e) = {
  let url = if "url" in e { e.url } else { none }
  let title = if "title" in e and e.title != "" { e.title } else { none }

  let date = e.date.display("[month repr:long] [day], [year]")

  #event(e.speaker, date: date, url: url)[
    #if title != none { [#title] }
  ]
}

#let unique(xs) = {
  let out = ()
  for x in xs {
    if not out.contains(x) { out.push(x) }
  }
  out
}

#let sorted = events.sorted(key: e => e.date)
#let today = datetime.today()

#let upcoming = sorted.filter(e => e.date >= today)
#let past = sorted.filter(e => e.date < today).rev()

== Upcoming
#if upcoming.len() == 0 {
  _No upcoming events listed._
} else {
  # for e in upcoming { render-item(e) }
}

== Past Events
#if past.len() == 0 {
  _No past events listed._
} else {
  #let years = unique(past.map(e => e.date.year))
  #for y in years {
    === #y
    #for e in past.filter(e => e.date.year == y) { render-item(e) }
  }
}
