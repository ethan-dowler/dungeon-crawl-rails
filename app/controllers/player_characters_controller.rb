class PlayerCharactersController < ApplicationController
  helper_method :save_file

  def save_file
    @save_file ||= SaveFile.find(params[:save_file_id])
  end
end
