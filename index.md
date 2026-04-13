---
layout: default
title: Home
---

## Welcome

This site contains session notes, amongst other things

### Sessions

Total Sessions: {{ site.sessions | size }}

- **[Kent Womens](/sessions/kent-womens/)**
- **[Kent Mens](/sessions/kent-mens/)**
- **[Friday Social Sessions](/sessions/friday-social-sessions/)**
- **[Bromley Sessions](/sessions/bromley/)**
- **[U18s](/sessions/u18s/)**

---

## Latest sessions

{% assign latest = site.sessions | sort: "date" | reverse | slice: 0, 10 %}

<ul>
  {% for session in latest %}
    <li>
      <a href="{{ session.url }}">{{ session.title }}</a>
      <small>
        ({{ session.group }} — {{ session.date | date: "%d %b %Y" }})
      </small>
    </li>
  {% endfor %}
</ul>

# All Sessions

{% assign all = site.sessions | sort: "date" | reverse %}

<ul>
  {% for allSession in all %}
    <li>
      <a href="{{ allSession.url }}">{{ allSession.title }}</a>
      <small>
        ({{ allSession.group }} — {{ allSession.date | date: "%d %b %Y" }})
      </small>
    </li>
  {% endfor %}
</ul>

<style>
  h1 {
    margin-top: 0;
  }
  h2 {
    margin-bottom: 0.2em;
    margin-top: 1em;
  }
  h3 {
    margin-bottom: 0.2em;
    margin-top: 0.8em;
  }
  ul {
    list-style: none;
    padding-left: 0;
  }
  li {
    margin-bottom: 0.5em;
  }
  time {
    color: #666;
    font-size: 0.9em;
    margin-left: 0.5em;
  }