module ApplicationHelper

  def full_title(page_title="")
    base_titile = "Sample App"
    if page_title.empty?
      base_titile
    else
      "#{page_title} | #{base_titile}"
    end

  end
end
