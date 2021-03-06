# This class is in charge of Invitation's CRUD
class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :edit, :update, :destroy]

  # GET /invitations
  # GET /invitations.json
  def index
    @invitations = Invitation.all
  end

  # GET /invitations/1
  # GET /invitations/1.json
  def show
    render 'show'
  end

  # GET /invitations/new
  def new
    @invitation = Invitation.new
    @user_match = User.find(params[:id])
    # @locales = Local.all
  end

  # GET /invitations/1/edit
  def edit; end

  # POST /invitations
  # POST /invitations.json
  def create
    @invitation = Invitation.new(invitation_params)
    respond_to do |format|
      if @invitation.save
        format.html do
          redirect_to matches_find_path,
                      notice: 'Invitation was successfully created.'
        end
      else
        format.html { render :new }
        format.json { render json: @invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  def check_date
    format.html { redirect_to matches_find_path } if @invitation_params.acepta == true
    # redirect_to :action 'new', controller: 'cita'
  end

  # PATCH/PUT /invitations/1
  # PATCH/PUT /invitations/1.json
  def update
    respond_to do |format|
      puts 'hola1'
      if @invitation.update(invitation_params)
        if @invitation.confirma == true
          format.html do
            redirect_to new_invitation_citum_path(@invitation.id),
                        notice: 'Se ha creado una cita'
          end
          # redirect_to :action 'new', controller: 'cita'
        end
        # format.html {
        # redirect_to matches_find_path, notice: 'Invitation was successfully updated.'
        # }
        # format.json { render :show, status: :ok, location: @invitation }
      else
        format.html { render :edit }
        format.json { render json: @invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invitations/1
  # DELETE /invitations/1.json
  def destroy
    @invitation.destroy
    respond_to do |format|
      format.html { redirect_to invitations_url, notice: 'Invitation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_invitation
    @invitation = Invitation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def invitation_params
    params.require(:invitation).permit(:user_invita, :user_invitado, :fecha, :local_id, :confirma)
  end
end
