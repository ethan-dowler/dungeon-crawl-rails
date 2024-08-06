class SaveFilesController < ApplicationController
  before_action :ensure_location, only: :show

  helper_method :save_file

  def show; end

  private

  def ensure_location
    return if save_file.location_id.present?

    save_file.update!(location: Map.first.find_tile(x: 0, y: 0, z: 0))
  end

  def save_file
    @save_file ||= SaveFile.find(params[:id])
  end
end
