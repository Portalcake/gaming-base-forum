module Forum
  class ApplicationController < ::ApplicationController
    def redirect_on_error
      forum.root_url
    end
  end
end
