class CheckoutController < ApplicationController
  before_action :validate_input
  def create
    @terminal = Terminal.new(build_terminal)
    render json: @terminal.total, status: :ok
  end

  private

  def validate_input
    render status: 422 and return unless params[:checkout_data].present?
  end

  def build_terminal
    params[:checkout_data].split('').sort
  end
end
