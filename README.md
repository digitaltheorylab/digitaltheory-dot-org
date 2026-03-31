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

[Typst](https://typst.app/docs/tutorial/) is a modern markup and scripting language used to author all content (`.typ` files). It supports basic markup, structured data, and conditional rendering.

[Rheo](https://rheo.ohrg.org/) is a static site generator that compiles Typst to HTML, PDF, and EPUB. It is configured via `rheo.toml`. To build locally, download Rheo and run:

```sh
rheo watch . --html --open
```

## Deployment

The site is hosted on **Netlify** and auto-deploys on pushes to the `main` branch on GitHub.

- **Build command** (from `netlify.toml`): `bash build.sh`
- **Publish directory**: `build/html`

### What `build.sh` does

1. Downloads the `rheo` binary from GitHub releases if not cached.
2. Downloads Berkeley Mono fonts from a private GitHub repo using the `FONTS_GITHUB_TOKEN` env var (set in the Netlify dashboard). Falls back to local `fonts/` symlinks if the variable is not set.
3. Runs `rheo compile . --html` to generate `build/html/`.
4. Copies `content/img/` into the build output.

The `FONTS_GITHUB_TOKEN` secret must be configured in **Netlify → Site settings → Environment variables**.

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

- Events are automatically sorted by date and split into **Upcoming** / **Past** sections — no manual ordering needed.
- `url` is optional; omit the field entirely if there is no link.
- For conferences or multi-speaker events, use the event or group name as `speaker`.

## Adding People

Edit `content/people.typ`. Add a `#person()` call in the appropriate section (`== Local Team` or `== Global Partners`):

```typst
#person("Full Name",
  role: "Title or Position",
  affiliation: "Institution",
  url: "https://optional-profile-link")
```

- All named arguments are optional; omit any that don't apply.
- Order within a section is manual — place the entry where it should appear in the list.
