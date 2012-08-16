module DoctorsHelper
  
  def doctors_for_select(doctors)
    doctors.collect {|d| [ d.name, d.id ]}
  end
end
