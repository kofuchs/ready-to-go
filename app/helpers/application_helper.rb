# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title(str)
    @page = str
  end
  
  def flash_messages
    messages = []
    %w(notice warning error).each do |msg|
      messages << content_tag(:div, html_escape(flash[msg.to_sym]), :id => "flash-#{msg}") unless flash[msg.to_sym].blank?
    end
    messages
  end
end
