---
layout: default
title: Home
---

<div class="intro-card">
  <h2>Welcome</h2>
  <p>This site brings together session notes, coaching reflections, and project updates in one place. It is a simple record of progress, ideas, and the work happening across different groups and projects.</p>
</div>

<div class="section">
  <h3>What you can explore</h3>
  <ul>
    <li>Session summaries and matchday notes</li>
    <li>Project write-ups and build logs</li>
    <li>Reflections on coaching, development, and progress</li>
  </ul>
</div>

<div class="section">
  <h3>Recent articles</h3>
  {% assign recent_posts = site.posts | sort: "date" | reverse | slice: 0, 3 %}
  {% if recent_posts.size > 0 %}
    <ul>
      {% for post in recent_posts %}
        <li>
          <a href="{{ post.url }}">{{ post.title }}</a>
          <small>{{ post.date | date: "%d %b %Y" }}</small>
        </li>
      {% endfor %}
    </ul>
  {% else %}
    <p>More writing will appear here soon.</p>
  {% endif %}
</div>

<div class="section">
  <h3>Session groups</h3>
  <p>Total sessions: {{ site.sessions | size }}</p>
  <ul>
    <li><a href="/sessions/kent-womens/">Kent Womens</a></li>
    <li><a href="/sessions/kent-mens/">Kent Mens</a></li>
    <li><a href="/sessions/friday-junior-sessions/">Friday Junior Sessions</a></li>
    <li><a href="/sessions/bromley/">Bromley Sessions</a></li>
    <li><a href="/sessions/u18s/">U18s</a></li>
    <li><a href="/sessions/u16s/">U16s</a></li>
    <li><a href="/sessions/SEVA/">SEVA</a></li>
  </ul>
</div>

<div class="section">
  <h3>Latest sessions</h3>
  {% assign latest = site.sessions | where_exp: "item", "item.date" | where_exp: "item", "item.url != '/sessions/'" | where_exp: "item", "item.url != '/sessions/bromley/'" | where_exp: "item", "item.url != '/sessions/kent-womens/'" | where_exp: "item", "item.url != '/sessions/kent-mens/'" | where_exp: "item", "item.url != '/sessions/friday-junior-sessions/'" | where_exp: "item", "item.url != '/sessions/u18s/'" | where_exp: "item", "item.url != '/sessions/u16s/'" | where_exp: "item", "item.url != '/sessions/SEVA/'" | sort: "date" | reverse | slice: 0, 10 %}
  <ul>
    {% for session in latest %}
      <li>
        <a href="{{ session.url }}">{{ session.title }}</a>
        <small>{{ session.date | date: "%d %b %Y" }} — {{ session.group }}</small>
      </li>
    {% endfor %}
  </ul>
</div>

<div class="section">
  <h3>All sessions</h3>
  {% assign all = site.sessions | where_exp: "item", "item.date" | where_exp: "item", "item.url != '/sessions/'" | where_exp: "item", "item.url != '/sessions/bromley/'" | where_exp: "item", "item.url != '/sessions/kent-womens/'" | where_exp: "item", "item.url != '/sessions/kent-mens/'" | where_exp: "item", "item.url != '/sessions/friday-junior-sessions/'" | where_exp: "item", "item.url != '/sessions/u18s/'" | where_exp: "item", "item.url != '/sessions/u16s/'" | where_exp: "item", "item.url != '/sessions/SEVA/'" | sort: "date" | reverse %}
  <ul>
    {% for allSession in all %}
      <li>
        <a href="{{ allSession.url }}">{{ allSession.title }}</a>
        <small>{{ allSession.date | date: "%d %b %Y" }} — {{ allSession.group }}</small>
      </li>
    {% endfor %}
  </ul>
</div>

<style>
  .intro-card {
    background: #f8fafc;
    border: 1px solid #e5e7eb;
    border-radius: 8px;
    padding: 1rem 1.25rem;
    margin-bottom: 1rem;
  }
  .section {
    margin-top: 1.25rem;
  }
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