#import "index.typ": template, event, organize-events, display-past-by-year
#show: template.with(current-page: "events")

#let events-list = yaml("data/events.yaml").map(e => (
  speaker: e.speaker,
  date: {
    let parts = e.date.split("-")
    datetime(year: int(parts.at(0)), month: int(parts.at(1)), day: int(parts.at(2)))
  },
  url: e.at("url", default: none),
  title: e.at("title", default: ""),
))

#let organized = organize-events(events-list)

== Upcoming
#if organized.upcoming.len() > 0 {
  for e in organized.upcoming {
    event(e.speaker, date: e.date, url: e.url)[#e.title]
  }
} else {
  [No upcoming events scheduled.]
}

== Past Events
#let past-by-year = display-past-by-year(organized.past)
#for year in past-by-year.keys().sorted().rev() [
  === #year
  #for e in past-by-year.at(year) {
    event(e.speaker, date: e.date, url: e.url)[#e.title]
  }
]
