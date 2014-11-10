class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
      flash.now[:notice] = "Thanks. I'll contact you before 360.000 babies are born! (<em><a href='http://www.ecology.com/birth-death-rates/' target='_blank'>whaaat ???</a></em>)".html_safe
    else
      flash.now[:error] = 'Cannot send message.'
    end
    render :new
  end
end