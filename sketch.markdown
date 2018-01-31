---
layout: default
title: Sketch
---

Mini articles like `Today I Learn`, `How to's`, `Snippets` and maybe something else, who knows?

<ol>
{% for post in site.posts %}
  <li>
    <a class="post-link" href="{{ post.url }}">{{ post.title }}</a>
    <small>
      {% if post.category %}
      <span class="post-category">#{{ post.category }}</span>
      {% endif %}
      <span class="post-date">@{{ post.date | date: "%B %e, %Y" }}</span>.
      <!-- <a class="post-comments" href="{{ post.url }}#disqus_thread">Comments</a> -->
    </small>
  </li>
{% endfor %}
</ol>
