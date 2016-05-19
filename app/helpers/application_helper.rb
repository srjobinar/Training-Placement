module ApplicationHelper
  def fulltitle(title=" ")
    if title.empty?
      "Training And Placement Cell"
    else
      title+" | Training And Placement Cell"
    end
  end
end
