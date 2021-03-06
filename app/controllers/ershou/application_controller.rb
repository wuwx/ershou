# encoding: utf-8

module Ershou
  class ApplicationController < ::ApplicationController

    respond_to :html, :js
    before_filter :authenticate_user!

    before_filter do
      @nodes = Node.all
      @current = [ topics_path ]
      drop_page_title("二手市场")
      drop_breadcrumb("二手市场", topics_path)
    end

    protected
      def current_ability
        @current_ability ||= Ability.new(current_user)
      end

  end
end
