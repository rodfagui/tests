class ArraysNumbersController < ApplicationController
  before_action :find_arrays_number, except: %i[create]

  def create
    new_array = ArrayServices.new(array_params[:num_of_elements]).create_shuffle_array
    new_array_number_instance = ArraysNumber.create(array: new_array.to_json)
    render json: new_array_number_instance, status: :created
  end

  def show
    longest_range = ArrayServices.get_longest_range(JSON.parse(@arrays_number.array))
    render json: { longest_range: longest_range }, status: :ok
  end

  private

  def array_params
    params.require(:arrays_number).permit(:num_of_elements)
  end

  def find_arrays_number
    @arrays_number = ArraysNumber.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Arrays Number not found' }, status: :not_found
  end
end