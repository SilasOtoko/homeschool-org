class CalendarEntriesController < ApplicationController
  def new
    @calendar_entry = CalendarEntry.new
  end

  def create
    @calendar_entry = CalendarEntry.new(calendar_params)
    @calendar_entry.homeschool = current_user.homeschool

    if @calendar_entry.save
      flash[:notice] = "Entry Added"
      redirect_to calendar_path
    else
      render 'new'
    end
  end
  
  private
  
  def calendar_params
    params.require(:student).permit!
  end
end