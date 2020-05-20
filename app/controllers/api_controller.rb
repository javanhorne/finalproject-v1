class ApiController < ApplicationController

  def fhir_call
      # require fhir_client
      # desc 'Call FHIR on Open EPIC'
      baseurl = "https://open-ic.epic.com/FHIR/api/FHIR/DSTU2/"
      patient_search = "/Patient?given=Jason&family=Argonaut"
      client = FHIR::Client.new(baseurl)
      # client.default_json
      FHIR::Model.client = client

    # autodetect the FHIR version

        # version = client.detect_version

        #   if version == :stu3
        #     puts 'FHIR Client using STU3'
        #   elsif version == :dstu2
        #     puts 'FHIR Client using DSTU2'
        #   elsif version == :r4
        #     puts 'FHIR Client using R4'
        #   end


      @reply = FHIR::Patient.search(given: 'James', family: 'Kirk')
      @bundle = @reply.entry
      @patient = @bundle.first.resource
      @patient_id = @patient.id
      @patient_dob = @patient.birthDate
      @patient_gender = @patient.extension[2].valueCodeableConcept.coding[0].code

      @patient_given_name = @patient.name[0].given[0]
      @patient_family_name = @patient.name[0].family
      
      


      @condition = client.search(FHIR::Condition, search: { parameters: {patient:@patient_id}})
      @condition_reply = @condition.resource
      @condition_reply1 = @condition_reply.entry
      @condition_reply2 = @condition_reply1.first.resource

      


    render ({ :template => "api/fhir.html.erb"})

  end
end