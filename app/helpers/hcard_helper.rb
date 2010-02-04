module HcardHelper
  def render_hcard
    render_to_string :template => 'hcard/hcard_block', :layout => false
  end

	class Macro
		def initialize(view)
		  @view = view
		  @view.controller.extend(HcardHelper)
		end

		def render()
      @view.controller.render_hcard
		end
	end
end
