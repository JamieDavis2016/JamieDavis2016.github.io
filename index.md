---
layout: default
title: Home
---

## Welcome

This site contains session notes, amongst other things

### Sessions

- **[Kent Womens](/sessions/kent-womens/)**
- **[Friday Social Sessions](/sessions/friday-social-sessions/)**
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
