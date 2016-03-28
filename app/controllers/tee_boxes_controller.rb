class TeeBoxesController < ApplicationController
  def update
    tee_box = TeeBox.find tee_box_params[:id]
    tee_box.attributes = tee_box_params[:tee_box]
    tee_box.save!

    redirect_to rounds_path
  end

  private

  def tee_box_params
    params.permit(:id, tee_box: [holes_attributes: [:id, :yardage, :par, :handicap]])
  end
end
