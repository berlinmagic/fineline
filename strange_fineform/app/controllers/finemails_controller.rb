# encoding: utf-8
class FinemailsController < ApplicationController
  
  def pic_fineform
    
  end
  
  def new
    @u_aktiv = "wl_new"
    @finemail = Finemail.new
  end
  
  def create
    @finemail = Finemail.new(params[:finemail])
    if @finemail.finemail_fields
      @finemail.finemail_fields.each do |fmf|
        if fmf.um
          @finemail.absender = fmf.inhalt
        end
      end
    end
    if Abschnitt.find(params[:finemail][:abs])
      @abs = Abschnitt.find(params[:finemail][:abs])
    end
    if @finemail.save
      Finemailer.fine_mail(@finemail).deliver
      @finemail.sended = Time.now
      @finemail.user_ip = request.remote_ip
      @finemail.neu = true
      @finemail.save
    else
      render :action => "new"
    end
  end
  
  def create_form_part
    @finemail = Finemail.new(params[:finemail])
    if @fineform = Fineform.find(params[:finemail][:fineform_id])
        if params[:finemail][:form_part]
            form_part = params[:finemail][:form_part].to_i + 1
            if form_part < @fineform.fineform_fieldsets.count
                @fineform.fineform_fieldsets.each_with_index do |fffs,index|
                    if index == form_part
                        @fineform_fieldset = fffs
                        @next_part = 1 if (form_part + 1) < @fineform.fineform_fieldsets.count
                    end
                end
                @last_part = false
                @form_part = form_part
            else
                @last_part = true
                @counta = @fineform.fineform_fieldsets.count
                @form_part = form_part
            end
        end
    end
    if @finemail.save
      if @last_part
        Finemailer.fine_mail(@finemail).deliver
        @finemail.sended = Time.now
        @finemail.user_ip = request.remote_ip
        @finemail.neu = true
        @finemail.save
      end
    else
      render :action => "new"
    end
  end
  
  def update
    if @finemail = Finemail.find(params[:finemail][:this_id])
      
      if @fineform = Fineform.find(params[:finemail][:fineform_id])
          if params[:finemail][:form_part]
              form_part = params[:finemail][:form_part].to_i + 1
              if form_part < @fineform.fineform_fieldsets.count
                  @fineform.fineform_fieldsets.each_with_index do |fffs,index|
                      if index == form_part
                          @fineform_fieldset = fffs
                          @next_part = 1 if (form_part + 1) < @fineform.fineform_fieldsets.count
                      end
                  end
                  @last_part = false
                  @form_part = form_part
              else
                  @last_part = true
                  @counta = @fineform.fineform_fieldsets.count
                  @form_part = form_part
              end
          end
      end
    
    else
      @erroar = 'Fehler'
      render "create_form_part"
    end
    
    if @finemail.update_attributes(params[:finemail])
      if @last_part
        Finemailer.fine_mail(@finemail).deliver
        @finemail.sended = Time.now
        @finemail.user_ip = request.remote_ip
        @finemail.neu = true
        @finemail.save
      end
      render "create_form_part"
    else
      @erroar = 'Fehler'
      render "create_form_part"
    end
  end
  
  
  
  
end

