module DeviseHelper
	def devise_error_messages!
		return '' if resource.errors.empty?

		sentence = I18n.t('errors.messages.not_saved', count: resource.errors.count, resource: resource.class.model_name.human.downcase)
		messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
		html = <<-HTML
		<div id="error_explanation">
			<div class="alert alert-error">
				#{sentence}
			</div>
			<ul>
				#{messages}
			</ul>
		</div>
		HTML

		html.html_safe
	end
end

			

