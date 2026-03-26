#import "site.typ": template, event, render-event, get-unique-years
#import "data/events.typ": events
#show: template.with(current-page: "events")

= Events

#let sorted = events.sorted(key: e => e.date)
#let today = datetime.today()

#let upcoming = sorted.filter(e => e.date >= today)
#let past = sorted.filter(e => e.date < today).rev()

== Upcoming
#if upcoming.len() == 0 [
  _No upcoming events listed._
] else [
  #for e in upcoming { render-event(e) }
]

== Past Events
#if past.len() == 0 [
  _No past events listed._
] else [
  #let years = get-unique-years(past.map(e => e.date.year()))
  #for y in years [
    === #y
    #for e in past.filter(e => e.date.year() == y) { render-event(e) }
  ]
]
