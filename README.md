# digitaltheory.org

Website for the Digital Theory Lab, live at [[https://digitaltheory.org]].

## File Tree

```
digitaltheory.org/
├── content/
│   ├── data/
│   │   └── events.typ      # Structured event data
│   ├── img/
│   │   └── header.svg
│   ├── index.typ           # Homepage
│   ├── research.typ        # Research page
│   ├── people.typ          # People page
│   ├── events.typ          # Events page (rendering logic)
│   ├── references.bib      # Bibliography
│   └── site.typ            # Shared templates (template, person, event)
├── style.css               # Site stylesheet
├── rheo.toml               # Rheo configuration
├── netlify.toml            # Netlify deployment config
└── build.sh                # Build script (used by Netlify)
```

## Stack: Typst & Rheo

[Typst](https://typst.app/docs/tutorial/) is a modern markup and scripting
language used to author all content (`.typ` files). It supports basic markup,
structured data, and conditional rendering.

[Rheo](https://rheo.ohrg.org/) is a static site generator that compiles Typst
to HTML, PDF, and EPUB. It is configured via `rheo.toml`. To build locally,
download Rheo and run:

```sh
rheo watch . --html --open
```

## Deployment

The site is hosted on **Netlify** and auto-deploys on pushes to the `main`
branch on GitHub.

- **Build command** (from `netlify.toml`): `bash build.sh`
- **Publish directory**: `build/html`

### What `build.sh` does

1. Downloads the `rheo` binary from GitHub releases if not cached.
2. Downloads Berkeley Mono fonts from a private GitHub repo using the
   `FONTS_GITHUB_TOKEN` env var (set in the Netlify dashboard). Falls back to
   local `fonts/` symlinks if the variable is not set.
3. Runs `rheo compile . --html` to generate `build/html/`.
4. Copies `content/img/` into the build output.

The `FONTS_GITHUB_TOKEN` secret must be configured in **Netlify -> Site
settings → Environment variables**.

## Adding Events

Edit `content/data/events.typ`. Append a new tuple to the `events` array:

```typst
(
  speaker: "Speaker Name (Institution)",
  date: datetime(year: YYYY, month: MM, day: DD),
  title: [Event Title],
  url: "https://optional-link",  // omit if no link
),
```

- Events are automatically sorted by date and split into **Upcoming** /
  **Past** sections.
- `url` is optional; omit the field entirely if there is no link.
- For conferences or multi-speaker events, use the event or group name as
  `speaker`.

## Adding People

Edit `content/data/people.typ`. Append a new tuple to the `people` array:

```typst
(
  name: "Full Name",
  role: "Title or Position",
  url: "https://optional-profile-link",  // omit if no link
  institution: "Institution",
  affiliation: groups.<AFFILIATION>,  // groups.team OR groups.grad OR groups.affiliate
)
```

- People are automatically sorted by affiliation and alphabetical order.
- `url` is optional; omit the field if there is no link.
- Use only one affiliation key; see `groups` in `content/data/people.typ`

