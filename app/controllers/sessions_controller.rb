require "opentok"

class SessionsController < ApplicationController
# "API KEY", "API SECRET"
  @@opentok = OpenTok::OpenTok.new "45238082", "a62d3ab57b303a797049e5357d8851e16248dc32"
  def new

    # A session that will use the OpenTok Media Server:
    session = @@opentok.create_session :media_mode => :routed
    # Store this sessionId in the database for later use:
    session_id = session.session_id

    @session = Session.create(session_id: session.session_id, open: true)
    @session.save

    render json: @session
  end

  def create
  end

  def close
    session = Session.find_by(id: params[:id])
    session.update(open: false)
    redirect_to :back
  end

  def token
    if not params[:id].blank?
      s = Session.find_by(id: params[:id])
      token = @@opentok.generate_token s.session_id

      @token = Token.create(session_id: s.id, token: token, active: true)
      @token.save

      jsonResult = {:session_id => s.session_id, :token => token }
      render json: jsonResult

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
  end
end
