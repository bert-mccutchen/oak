# frozen_string_literal: true

class QuotesController < ApplicationController
  before_action :set_quote, only: %i[show edit update destroy]

  def index
    @quotes = Quote.all.order(:position)
  end

  def show
    redirect_to quotes_path
  end

  def new
    @quote = Quote.new
  end

  def edit
  end

  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      redirect_to @quote, success: "Quote created."
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @quote.update(quote_params)
      redirect_to @quote, success: "Quote updated.", status: :see_other
    else
      Rails.logger.error(@quote.errors.full_messages)
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @quote.destroy!

    redirect_back fallback_location: quotes_path, warning: "Quote destroyed.", status: :see_other
  end

  def reroll_daily
    Rails.cache.delete("quote/daily_pick")

    position = Quote.daily_pick.position
    alert = position.in?([ 1, 20 ]) ? "You rolled a natural #{position}!" : "You rolled a #{position}."

    redirect_back fallback_location: quotes_path, info: alert, status: :see_other
  end

  private

  def set_quote
    @quote = Quote.find_by!(token: params.expect(:token))
  end

  def quote_params
    params.expect(quote: %i[quote author position])
  end
end
