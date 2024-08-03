class SaveFilesController < ApplicationController
  helper_method :save_file

  def show; end

  private

  def save_file
    @save_file ||= SaveFile.find(params[:id])
  end
end
