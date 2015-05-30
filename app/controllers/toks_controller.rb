require "opentok"

class ToksController < ApplicationController
# "API KEY", "API SECRET"
  @@opentok = OpenTok::OpenTok.new "45238082", "a62d3ab57b303a797049e5357d8851e16248dc32"
  def new

    # A session that will use the OpenTok Media Server:
    session = @@opentok.create_session :media_mode => :routed
    # Store this sessionId in the database for later use:
    session_id = session.session_id
    @appointment = Appointment.find(params[:appointment_id])
    @session = Session.create(session_id: session.session_id, open: true, appointment: @appointment)
    @session.save


    render json: tok_view_path(@session).to_s, status: :ok
  end

  def create
    redirect_to root_path
  end

  def close
    session = Session.find_by(id: params[:id])
    session.update(open: false)
    redirect_to :back
  end

  def token
    if not params[:session_id].blank?
      @token = Token.find_by(session_id: params[:session_id])

      if @token
        token = @token.token
      else
        token = @@opentok.generate_token params[:session_id]

        @token = Token.create(session_id: params[:session_id], token: token, active: true)
        @token.save
      end

      jsonResult = { :token => token }
      render :json => jsonResult

    end
  end

  def all
    render json: Session.all
  end

  def index
    @sessions = Session.where(open: true)
  end

  def view
    @id = params[:id]
    @session = Session.find(@id)

    if not user_signed_in?
      flash[:notice] = "You must be logged in to join a session"
      redirect_to action: "index"
      return
    end

    if (current_user.is_provider)
      @userType = 'provider'
    else
      @userType = 'patient'
    end
  end
end
