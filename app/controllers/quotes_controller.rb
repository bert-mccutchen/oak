class QuotesController < ApplicationController
  before_action :set_quote, only: %i[show edit update destroy]

  def index
    @quotes = Quote.all.order(:position)
  end

  def show
    redirect_to quotes_path(anchor: @quote.token)
  end

  def new
    @quote = Quote.new
  end

  def edit
  end

  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      redirect_to @quote, notice: "Quote created."
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @quote.update(quote_params)
      redirect_to @quote, notice: "Quote updated.", status: :see_other
    else
      Rails.logger.error(@quote.errors.full_messages)
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @quote.destroy!

    redirect_to quotes_path, notice: "Quote destroyed.", status: :see_other
  end

  def reroll_daily
    Rails.cache.delete("quote/daily_pick")

    redirect_to quotes_path, notice: "Daily pick rerolled!", status: :see_other
  end

  private

  def set_quote
    @quote = Quote.find_by!(token: params.expect(:token))
  end

  def quote_params
    params.expect(quote: %i[quote author position])
  end
end
