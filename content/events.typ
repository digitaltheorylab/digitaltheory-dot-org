#import "index.typ": template, event, organize-events, display-past-by-year
#show: template.with(current-page: "events")

#let events-list = (
  // 2026
  (speaker: "Ellie Pavlick (NYU)", date: datetime(year: 2026, month: 2, day: 6), url: "https://as.nyu.edu/research-centers/remarque/events/Spring-2026/ellie-pavlick---how--does-ai-think-.html", title: "\"(How) Does AI Think?\""),
  (speaker: "Alijan Ozkiral (NYU)", date: datetime(year: 2026, month: 2, day: 13), title: "\"Slop Practices\""),
  (speaker: "Cultural AI", date: datetime(year: 2026, month: 3, day: 9), title: ""),
  (speaker: "Sam Kellogg (U Montana)", date: datetime(year: 2026, month: 4, day: 3), title: "\"Computational Earthwork: The U.S. Highway System and the Dawn of Digital Terrain Modeling\""),
  (speaker: "Terry Winograd (Stanford)", date: datetime(year: 2026, month: 4, day: 21), title: "\"What's Up With AI?\""),
  
  // 2025
  (speaker: "Lily Chumley (NYU)", date: datetime(year: 2025, month: 5, day: 2), title: "\"(Semiotic) Multimodality Versus the Media of Research\""),
  (speaker: "Naja LeFevre Grundtmann (SDU)", date: datetime(year: 2025, month: 4, day: 25), title: "\"Smooth Tex(x)tures\""),
  (speaker: "Imogen Forbes-Macphail (Harvard)", date: datetime(year: 2025, month: 4, day: 21), title: "\"On the Four-Color Theorem and the Aesthetics of Computational Proof\""),
  (speaker: "Mercedes Bunz (KCL)", date: datetime(year: 2025, month: 4, day: 11), title: "\"On the Calculation of Meaning\""),
  (speaker: "Vernacular AI", date: datetime(year: 2025, month: 2, day: 6), url: "https://as.nyu.edu/research-centers/remarque/events/Spring-2025/vernacular-ai--2-day-symposium.html", title: "Two-day symposium"),
  (speaker: "Felicia Jing, Juana Becerra, and Ranjodh Singh Dhaliwal", date: datetime(year: 2025, month: 9, day: 19), title: "\"On Emplotment: Phantom Islands, Synthetic Data, and the Coloniality of Simulated Algorithmic Space\""),
  (speaker: "Zachary Stine (UCA)", date: datetime(year: 2025, month: 10, day: 10), title: "\"On The Differential Meaning of Models\""),
  (speaker: "Karen Hao", date: datetime(year: 2025, month: 10, day: 13), url: "https://as.nyu.edu/research-centers/remarque/events/Fall-2025/karen-hao-on-empire-of-ai.html", title: [_Empire of AI_ book talk. The Remarque Institute, 60 5th Avenue, 8th floor.]),
  (speaker: "Leif Weatherby (NYU), with Ben Recht (Berkeley)", date: datetime(year: 2025, month: 10, day: 30), title: "\"From Language Machines to Decision Machines—and Back\""),
  (speaker: "Sarah Pourciau (Duke)", date: datetime(year: 2025, month: 11, day: 7), title: "\"Symbolic Throughput\""),
  (speaker: "Hannes Bajohr (Berkeley) and Stephen Marche", date: datetime(year: 2025, month: 11, day: 20), title: "\"AI and the Novel\""),
  (speaker: "Hannes Bajohr (Berkeley)", date: datetime(year: 2025, month: 11, day: 21), title: "\"The Latent Space of Meaning and the Novel: World Models in AI and Literature\""),
  
  // 2024
  (speaker: "Cameron Buckner (UF)", date: datetime(year: 2024, month: 1, day: 26), title: "Book talk, _From Deep Learning to Rational Machines_"),
  (speaker: "Yohei Igarashi (U Conn)", date: datetime(year: 2024, month: 2, day: 2), title: "\"Understanding Literary Science ca. 1930\""),
  (speaker: "Allison Parrish (NYU)", date: datetime(year: 2024, month: 2, day: 23), title: "\"Computation, Collage, and the Cut\""),
  (speaker: "James Duesterberg", date: datetime(year: 2024, month: 4, day: 5), title: "\"Zero Signifier\""),
  (speaker: "Stephanie Dick (SFU)", date: datetime(year: 2024, month: 4, day: 19), title: "\"The Marxist in the Machine\""),
  (speaker: "Kathrin Maurer (SDU)", date: datetime(year: 2024, month: 4, day: 24), title: "Book talk, _The Drone Sensorium_"),
  (speaker: "Semiotic Machines: Artificial Text and the Praxis of Reading", date: datetime(year: 2024, month: 5, day: 29), url: "https://findresearcher.sdu.dk/ws/portalfiles/portal/269249394/Semiotic_Machines_Flyer.pdf", title: ""),
  (speaker: "Kyunghyun Cho (NYU) and Nick Seaver (Tufts)", date: datetime(year: 2024, month: 9, day: 20), title: "Oral History of Neural Nets (with NYU's Center for Data Science)"),
  (speaker: "Johan Malmstedt (Umeå) and Sebastian Breu (Humboldt)", date: datetime(year: 2024, month: 10, day: 4), title: "\"The Similarity Engine: Towards a Media History of Vector Modeling\""),
  (speaker: "Cliff Siskin (NYU)", date: datetime(year: 2024, month: 10, day: 25), title: "\"The Advancement of Knowledge\""),
  (speaker: "Beatrice Fazi (Sussex)", date: datetime(year: 2024, month: 11, day: 1), title: "\"The Computational Search for Unity: Synthesis in Generative AI\""),
  (speaker: "Jed Dobson (Dartmouth)", date: datetime(year: 2024, month: 11, day: 15), title: "\"On Reading and Interpreting Black Box Deep Neural Networks\""),
  
  // 2023
  (speaker: "Signs of Artificial Life", date: datetime(year: 2023, month: 3, day: 30), url: "https://digitalhumanities.nyu.edu/news/2023-06-28-hayles-deacon-recordings/", title: ""),
  (speaker: "Re-Interpretation: Hermeneutics in the Age of AI", date: datetime(year: 2023, month: 9, day: 22), url: "https://as.nyu.edu/departments/english/Events/fall-2023/re-interpretation--hermeneutics-in-the-age-of-ai.html", title: ""),
  (speaker: "Tyler Shoemaker (UC Davis)", date: datetime(year: 2023, month: 9, day: 29), title: "\"Distributional Semantics without Distributionalism\""),
  (speaker: "Tal Linzen (NYU)", date: datetime(year: 2023, month: 11, day: 6), title: "\"On Planting Trees in Language Models\""),
  (speaker: "Yining Shi (NYU)", date: datetime(year: 2023, month: 12, day: 1), title: "\"Building AI Video Generation Tools on the Web\""),
)

#let organized = organize-events(events-list)

== Upcoming
#if organized.upcoming.len() > 0 {
  for e in organized.upcoming {
    event(e.speaker, date: e.date, url: e.at("url", default: none))[#e.title]
  }
} else {
  [No upcoming events scheduled.]
}

== Past Events
#let past-by-year = display-past-by-year(organized.past)
#for year in past-by-year.keys().sorted(reverse: true) {
  === #year
  #for e in past-by-year.at(year) {
    event(e.speaker, date: e.date, url: e.at("url", default: none))[#e.title]
  }
}
