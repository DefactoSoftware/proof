module ApplicationHelper
  def nav_link_to(link_text, link_path)
    classes = "Navigation-link"
    classes += " is-active" if current_page?(link_path)
    link_to link_text, link_path, class: classes
  end

  def time_ago(time)
    time_ago_in_words(time) + " ago"
  end
end
