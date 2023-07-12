class CharactersController < ApplicationController
  helper_method :characters, :character

  private

  def characters
    @characters ||= Character.all
  end

  def character
    @character ||= Character.find(params[:id])
  end
end
