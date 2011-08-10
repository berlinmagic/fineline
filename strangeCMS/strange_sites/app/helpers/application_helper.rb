# encoding: utf-8
module ApplicationHelper
  
  
  
  
  
  
  def strange_devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource_name.to_s.humanize.capitalize)

    html = <<-HTML
    <div id="error_explanation">
      <h2>#{sentence}</h2>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end
  
  def strange_devise_user_error_messages!
    return "" if @user.errors.empty?

    messages = @user.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => @user.errors.count,
                      :resource => User)

    html = <<-HTML
    <div id="error_explanation">
      <h2>#{sentence}</h2>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end
  
# => # => # => # => # => # =>       Link Helfer       <=  #  <=  #  <=  #  <=  #  <=  #  <=  #  <=  #  <=  #

  
  
end
