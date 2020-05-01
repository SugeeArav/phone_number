class PhonesController < ApplicationController
  # GET /phones
  def index
    @phones = Phone.all

    render json: { phones: @phones.to_a.map(&:number) }
  end

  # POST /phones
  def create
    @phone = Phone.create(number: unique_number)

    render json: { phone: @phone.number }, status: :created
  end

  private

  def unique_number
    if valid_number?
      return params[:number] unless Phone.exists?(number: params[:number])
    end
    number = rand(1_111_111_111..9_999_999_999)
    unique_number if Phone.exists?(number: number)
    number
  end

  def valid_number?
    params[:number].present? && params[:number].to_i.between?(1_111_111_111, 9_999_999_999)
  end
end
