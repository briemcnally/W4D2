class CatRentalRequestsController < ApplicationController
  def new
    @cat_request = CatRentalRequest.new
    render :new
  end

  def create
    request = CatRentalRequest.new(cat_rental_params)

    if request.save
      redirect_to cat_url(request.cat_id)
    else
      render json: request.errors.full_messages, status: 422
    end
  end

  private

  def cat_rental_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date, :status)
  end
end

# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
