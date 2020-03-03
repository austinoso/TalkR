class LanguagesController < ApplicationController

    def index
        @langs = Language.all
    end
    
end
