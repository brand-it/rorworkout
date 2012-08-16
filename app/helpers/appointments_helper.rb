module AppointmentsHelper
  def format_last_appointment(appointment)
    if appointment.nil?
      return "There is no last appointment"
    else
      return appointment.visit_date
    end
  end
end
